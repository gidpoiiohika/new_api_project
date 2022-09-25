Rails.application.routes.draw do
  resources :notifications
  devise_for :users,
             controllers: {
                 sessions: 'users/sessions',
                 registrations: 'users/registrations'
             }
  resources :admins, only: [:index]
  resources :users

  root "pages#home"
end

