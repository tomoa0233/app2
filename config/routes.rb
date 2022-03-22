Rails.application.routes.draw do
  resources :users, only: [:show, :edit]
  resources :books, only: [:new, :index, :show, :edit]
  root to: 'homes#top'
  get "about" => "homes#about", as: "about"
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
