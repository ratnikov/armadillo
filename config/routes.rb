Armadillo::Application.routes.draw do
  resources :users, :only => [ :create ]
  match '/signup' =>'users#new', :as => :new_user

  root :to => 'pages#show', :id => 'home'
end
