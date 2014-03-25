MessageApi::Application.routes.draw do

  resources :users, only: [:index, :show, :create]
  resources :locations, only: [:index, :show, :create]

  get 'me', to: 'me#index'
  put 'me', to: 'me#update'

end
