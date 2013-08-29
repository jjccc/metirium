require 'capistrano/ext/multistage'
set :stages, ["staging", "production"]
set :default_stage, "staging"


set :application, 'metirium'
role :app, 'metirium'
role :web, 'www.metirium.com'

# The following configuration *optional*
set :scm, "git"
set :repository, "git@github.com:jjccc/metirium.git"
set :user, "jjccc"

