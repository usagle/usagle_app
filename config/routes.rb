Rails.application.routes.draw do
  devise_for :users
  resources :categories
  resources :items, only: %i[index show new create]

  namespace :admin do
    resources :items
  end

  root 'items#index'

  get '*path' => redirect('/')
end
