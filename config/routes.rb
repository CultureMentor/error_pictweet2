Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'users#show'
  resources :users, only: :show
  resources :tweets,only:[:index,:new,:craete,:edit,:update,:show,:destroy] do
    resources :comments, only: :create
    collection do
      get 'search'
    end
  end
end
