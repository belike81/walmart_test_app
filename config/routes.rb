Rails.application.routes.draw do
  root "products#index"
  resources :products, except: [:edit, :update, :new]
end
