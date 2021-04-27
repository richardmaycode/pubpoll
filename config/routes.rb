Rails.application.routes.draw do
  resources :polls do
    resources :votes, only: %i[show new create]
    resources :choices
    member do 
      get "settings"
      get "private"
      get "success"
    end
    collection do
      get "search"
      get "lookup"
    end
  end
  resources :votes, only: %i[show new create]
  resources :claimants, only: %i[show new create]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
