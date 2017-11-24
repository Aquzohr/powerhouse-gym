Rails.application.routes.draw do
  resources :serves
  post 'serves/checkout_all'

  root 'home#index'

  resources :members
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
