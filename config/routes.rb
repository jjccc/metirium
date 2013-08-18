Metirium::Application.routes.draw do
  devise_for :users do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  
  match "users/:user_id/measurements/new", as: "new_user_measurement", to:"measurements#new", via: [:get]
  match "users/:user_id/measurements", as: "create_user_measurement", to:"measurements#create", via: [:post]
  resources :users, :only => [:show] do
    resources :dashboards, :only => [:index]
    resources :dimensions do
      resources :measurements
    end
  end

  resources :leads, :only => [:new, :create, :destroy]
  match "leads/:digest/unsuscribe", to: "leads#destroy", via: [:get]      
  
  root :to => 'leads#new'
end
