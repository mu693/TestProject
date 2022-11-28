Rails.application.routes.draw do
  resources :appointment_dates

  ## Devise
  devise_for :users

  ## Letter_opener
  # mount LetterOpenerWeb::Engine, at: '/letter_opener'

  ## >>>>>> Root >>>>>>>>
  root to: 'home#index'

  ## Resources
  resources :users
  resources :medicines
  resources :diseases do
    collection do
      get 'search'
    end
  end
  resources :users
  resources :couriers
  resources :categories
  resources :patient_appointments do
    collection do
      get 'all_doctor'
      get 'history'
    end
  end
  resources :appointment_dates

  # require 'sidekiq-ent/web'
  # mount Sidekiq::Web => '/sidekiq'
end
