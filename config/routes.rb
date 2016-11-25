Rails.application.routes.draw do
  
  root 'polls#new'

  resources :users
  resources :polls
  resources :poll_items

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
