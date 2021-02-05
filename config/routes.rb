Rails.application.routes.draw do
  devise_for :users
  resources :users
  resources :situations, only: [:index, :show, :new, :create, :destroy] do
    resources :tsukkomis
  end
  root to: "situations#index"
end
