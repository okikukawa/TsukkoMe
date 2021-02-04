Rails.application.routes.draw do
  get 'tsukkomis/index'
  get 'tsukkomis/new'
  get 'tsukkomis/create'
  get 'tsukkomis/show'
  get 'tsukkomis/edit'
  get 'tsukkomis/destroy'
  resources :situations, only: [:index, :show, :new, :create, :destroy] do
    resources :tsukkomis
  end
end
