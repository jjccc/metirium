Metirium::Application.routes.draw do
  devise_for :users do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  
  resources :users, :only => [:show]

  resources :leads, :only => [:new, :create]
    
  resources :dimensions
  
  resources :measurements
  
  root :to => 'leads#new'
end
