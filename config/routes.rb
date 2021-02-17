Rails.application.routes.draw do
  devise_for :users
  resources :users, only:[:show] do
    get 'favorite', on: :member
  end
  resources :situations, only:[:index, :show, :new, :create, :destroy] do
    resources :tsukkomis do
      resources :comments, only:[:create, :edit, :update, :destroy]
    end
    get 'thousand_fungo', on: :collection
    get 'search', on: :member
  end
  resources :favorites, only:[:index, :create, :destroy]
  root to: "situations#index"
end
