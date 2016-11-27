Rails.application.routes.draw do
  
  root 'polls#new'

  # get 'votes', to: 'votes#create'
  # get 'votes/:poll_id', to: 'votes#show'

  resources :users

  resources :polls do
  	resources :votes
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
