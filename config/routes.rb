Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :campgrounds, only: [:create, :index, :edit, :update, :destroy]
  resources :campsites, only: [:create, :index, :edit, :update, :destroy]
end
