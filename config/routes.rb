Rails.application.routes.draw do
  
  root 'polls#new'

  resources :users

  resources :polls do
  	resources :votes
  end

  # get '/polls/expired.html.erb', to: 'votes#create'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
