Rails.application.routes.draw do
  devise_for :users
  resources :categories
  resources :items
  root 'items#index'

  get '*path' => redirect('/')
end
