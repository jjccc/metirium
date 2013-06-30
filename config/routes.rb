Metirium::Application.routes.draw do
  devise_for :users do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  resources :leads, :only => [:new, :create]
  
  resources :dashboards, :only => [:show]
  
  resources :dimensions, :only => [:index], :constraints => { :format => "json" }
  
  resources :measurements, :only => [:index], :constraints => { :format => "json" }

  root :to => 'leads#new'
end
