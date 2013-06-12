Metirium::Application.routes.draw do
  resources :leads, :only => [:new, :create]

  root :to => 'leads#new'
end
