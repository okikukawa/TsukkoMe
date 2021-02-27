Rails.application.routes.draw do
  root to: "situations#index"
  devise_for :users
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end
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

end
