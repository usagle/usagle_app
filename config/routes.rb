Rails.application.routes.draw do
  devise_for :users
  resources :items
  root 'welcome#index'

  get '*path' => redirect('/')
end
