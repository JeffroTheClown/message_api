MessageApi::Application.routes.draw do

  resources :users, only: [:index, :show, :create]
  resources :conversations, only: [:index, :show, :create, :update, :destroy] do
    resources :messages, only: [:index, :show, :create, :update, :destroy]
    resources :users, only: [:index, :create]
  end

  get 'me', to: 'me#index'
  put 'me', to: 'me#update'

end
