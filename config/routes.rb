Armadillo::Application.routes.draw do
  resources :users, :only => [ :create ]
  match '/signup' =>'users#new', :as => :new_user

  resource :session, :only => [ :create ]
  match '/login' => 'sessions#new'

  root :to => 'pages#show', :id => 'home'
end
