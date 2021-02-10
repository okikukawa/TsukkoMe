Rails.application.routes.draw do
  devise_for :users
  resources :users, only:[:show]
  resources :situations, only:[:index, :show, :new, :create, :destroy] do
    resources :tsukkomis
    get 'thousand_fungo', on: :collection
  end
  resources :favorites, only:[:index, :create, :destroy]
  root to: "situations#index"
end
