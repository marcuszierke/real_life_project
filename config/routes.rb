Rails.application.routes.draw do
  root 'pharmacies#index'
  resources :campaigns
  resources :pharmacies
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
