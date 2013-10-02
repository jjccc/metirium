Metirium::Application.routes.draw do
  devise_for :users do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  
  match "contact/new", as: "new_contact", to: "emails#new", via: [:get]
  match "contact/send", as: "unknown_contact", to: "emails#create", via: [:post]
  match "users/:user_id/measurements/new", as: "new_user_measurement", to: "measurements#new", via: [:get]
  match "users/:user_id/measurements", as: "create_user_measurement", to: "measurements#create", via: [:post]
  match "dimensions/:id", as: "dimension", to: "dimensions#show", via: [:get]
  match "users/:user_id/dimensions/:id/measurements/destroy", as: "destroy_all_measurements", to: "dimensions#destroy_measurements", via: [:delete]
  resources :users, :only => [:show] do
    resources :dashboards, :only => [:index]
    resources :dimensions do
      resources :measurements
    end
    resources :emails, :only => [:new, :create]
  end

  resources :leads, :only => [:new, :create, :destroy]
  match "leads/:digest/unsuscribe", to: "leads#destroy", via: [:get]  
          
  root :to => 'leads#new'
end
