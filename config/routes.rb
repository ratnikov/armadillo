
Armadillo::Application.routes.draw do
  resources :users, :only => [ :create, :destroy ]
  match '/signup' =>'users#new', :as => :new_user

  resource :session, :only => [ :create ]
  match '/login' => 'sessions#new'
  match '/logout' => 'sessions#destroy'

  root :to => 'pages#show', :id => 'home'
end
