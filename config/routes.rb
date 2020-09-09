Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    registrations: 'users/registrations'
  }
  devise_for :therapists, controllers: {
    sessions: 'therapists/sessions',
    passwords: 'therapists/passwords',
    registrations: 'therapists/registrations'
  }
  root "products#index"
  resources :products
end
