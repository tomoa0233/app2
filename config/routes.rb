Rails.application.routes.draw do
  devise_for :users
  get 'home/about' => 'homes#about' , as: 'about'
  resources :users, only: [:show, :index, :edit, :update]
  resources :books, only: [:update, :index, :show, :edit, :create, :destroy]
  root "homes#top"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
