Rails.application.routes.draw do

  resources :polls do
    get 'settings', on: :member
    get 'search', on: :collection
    get 'lookup', on: :collection
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
