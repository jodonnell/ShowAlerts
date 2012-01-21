ShowAlerts::Application.routes.draw do
  resources :bands, :except => [:show, :edit, :update]

  #get \"users\/show\"

  root :to => "bands#index"

  devise_for :users
  resources :users, :only => :show

end
