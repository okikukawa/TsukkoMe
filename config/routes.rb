Rails.application.routes.draw do
  resources :situations, only: [:index, :show, :new, :create, :destroy]
end
