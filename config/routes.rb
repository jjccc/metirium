Metirium::Application.routes.draw do
  devise_for :users do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  
  resources :users, :only => [:show] do
    resources :dashboards, :only => [:index]
    resources :dimensions
    resources :measurements
  end

  resources :leads, :only => [:new, :create, :destroy]
  match "leads/:digest/unsuscribe", to: "leads#destroy", via: [:get]      
  
  root :to => 'leads#new'
end
