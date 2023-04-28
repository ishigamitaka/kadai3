Rails.application.routes.draw do
  root to: "homes#top"
  devise_for :users
  get 'about' => 'homes#about'
  resources :users, only: [:show, :index, :edit, :update]
  resources :books, only: [:create, :show, :index, :update, :destroy, :edit]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
