Metirium::Application.routes.draw do
  resources :leads, :only => [:new, :create]
  
  resources :dashboards, :only => [:show]

  root :to => 'leads#new'
end
