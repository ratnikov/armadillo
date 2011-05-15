Armadillo::Application.routes.draw do
  match '/signup' =>'users#new', :as => :new_user

  root :to => 'pages#show', :id => 'home'
end
