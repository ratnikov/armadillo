
Armadillo::Application.routes.draw do
  resources :filters, :only => [ :index, :create ]
  resources :users, :only => [ :create, :destroy ]
  match '/signup' =>'users#new', :as => :new_user

  resource :session, :only => [ :create ]
  match '/login' => 'sessions#new', :as => :login
  match '/logout' => 'sessions#destroy', :as => :logout

  root :to => 'pages#show', :id => 'home'
end
