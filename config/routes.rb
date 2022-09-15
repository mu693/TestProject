Rails.application.routes.draw do
  
  ## Devise
  devise_for :users

  ## Letter_opener
  #mount LetterOpenerWeb::Engine, at: '/letter_opener'
  
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
  
  resources :couriers
  resources :categories
  
end
