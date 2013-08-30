require "bundler/capistrano"
set :bundle_without,  [:development, :test]

set :application, 'metirium'
#role :app, 'metirium'
#role :web, 'metirium'

# The following configuration *optional*
default_run_options[:pty] = true
ssh_options[:port] = 333
set :scm, "git"
set :scm_passphrase, ""
set :repository, "git@github.com:jjccc/metirium.git"
set :branch, "master"
set :user, "metirium"


server "metirium.com", :app, :web, :db, :primary => true
set :deploy_to, "ruby/metirium"
set :use_sudo, false

# Setup Shared Folders that should be created inside the shared_path
directory_configuration = %w(db config system)

# Setup Symlinks that should be created after each deployment
symlink_configuration = [
    %w(config/database.yml config/database.yml),
    %w(db/production.sqlite3 db/production.sqlite3),
    %w(system public/system)
]


namespace :deploy do
  task :restart, :roles => :web do
    run "touch #{ current_path }/tmp/restart.txt"
  end
end

after "deploy", "deploy:restart"



# =================================== #
# END CONFIGURATION #
# DON'T EDIT THE CONFIGURATION BELOW #
# =================================== #

#
# Helper Methods
#

def create_tmp_file(contents)
  system 'mkdir tmp'
  file = File.new("tmp/#{domain}", "w")
  file << contents
  file.close
end

#
# Capistrano Recipe
#
namespace :deploy do

  # Tasks that run after every deployment (cap deploy)

  desc "Initializes a bunch of tasks in order after the last deployment process."
  task :restart do
    puts "\n\n=== Running Custom Processes! ===\n\n"
    create_production_log
    setup_symlinks
    system 'cap deploy:passenger_restart'
  end
  
    # Deployment Tasks
  desc "Executes the initial procedures for deploying a Ruby on Rails Application."
  task :initial do
    system "cap deploy:setup"
    system "cap deploy"
    system "cap deploy:gems:install"
    system "cap deploy:db:migrate"
    system "cap deploy:passenger_restart"
  end

  desc "Restarts Passenger"
  task :passenger_restart,:roles => :app, :except => { :no_release => true } do
    puts "\n\n=== Restarting Passenger! ===\n\n"
    run "touch #{current_path}/tmp/restart.txt"
  end

  desc "Creates the production log if it does not exist"
  task :create_production_log do
    unless File.exist?(File.join(shared_path, 'log', 'production.log'))
      puts "\n\n=== Creating Production Log! ===\n\n"
      run "touch #{File.join(shared_path, 'log', 'production.log')}"
    end
  end

  desc "Creates symbolic links from shared folder"
  task :setup_symlinks do
    puts "\n\n=== Setting up Symbolic Links! ===\n\n"
    symlink_configuration.each do |config|
      run "ln -nfs #{File.join(shared_path, config[0])} #{File.join(release_path, config[1])}"
    end
  end

  # Manual Tasks

  namespace :db do
    desc "Create Production Database"
    task :create do
      puts "\n\n=== Creating the Production Database! ===\n\n"
      run "cd #{current_path}; rake db:create RAILS_ENV=production"
      system "cap deploy:set_permissions"
    end

    desc "Migrate Production Database"
    task :migrate do
      puts "\n\n=== Migrating the Production Database! ===\n\n"
      run "cd #{release_path}; rake db:migrate RAILS_ENV=production"
      system "cap deploy:set_permissions"
    end
    
    desc "Syncs the database.yml file from the local machine to the remote machine"
    task :sync_yaml do
      puts "\n\n=== Syncing database yaml to the production server! ===\n\n"
      unless File.exist?("config/database.yml")
        puts "There is no config/database.yml.\n "
        exit
      end
      system "rsync -vr --exclude='.DS_Store' config/database.yml #{user}@#{remote_host}:#{shared_path}/config/"
    end

  end

  
  namespace :gems do
    desc "Installs any 'not-yet-installed' gems on the production server or a single gem when the gem= is specified."
    task :install do
      if ENV['gem']
        puts "\n\n=== Installing #{ENV['gem']}! ===\n\n"
        run "gem install #{ENV['gem']}"
      else
        puts "\n\n=== Installing required RubyGems! ===\n\n"
        run "cd #{current_path}; rake gems:install RAILS_ENV=production"
      end
    end
  end

  desc "Run a command on the remote server. Specify command='my_command'."
  task :run_command do
    run "cd #{current_path}; #{ENV['command']}"
  end

  # Tasks that run after the (cap deploy:setup)

  desc "Sets up the shared path"
  task :setup_shared_path do
    puts "\n\n=== Setting up the shared path! ===\n\n"
    directory_configuration.each do |directory|
      run "mkdir -p #{shared_path}/#{directory}"
    end
    system "cap deploy:db:sync_yaml"
  end

end

# Callbacks
after 'deploy:setup', 'deploy:setup_shared_path'
after 'deploy:finalize_update', 'deploy:db:migrate'
#after 'deploy:finalize_update', 'deploy:passenger_restart'




























