Rails.application.routes.draw do
  
  root 'polls#new'

  # omniauth routes
  get 'auth/:provider/callback' => 'sessions#create'
  get 'auth/twitter', as: 'twitter_login'
  get 'auth/facebook', as: 'facebook_login'

  get 'logout' => 'sessions#destroy'

  # get 'votes/by_user' => 'votes#by_user'

  resources :users

  resources :polls do
  	resources :votes
  end

  # get '/polls/expired.html.erb', to: 'votes#create'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
