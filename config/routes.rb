Rails.application.routes.draw do

  resources :polls do
    resources :choices
    member do 
      get 'settings'
      get 'private'
    end
    collection do
      get 'search'
      get 'lookup'
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
