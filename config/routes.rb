Rails.application.routes.draw do
  devise_for :users
  #root 'searches#show'
  root 'welcome#index'
  resources :trains do
    resources :wagons, shallow: true
  end

  resources :railway_stations do
    patch :update_position, on: :member
    patch :update_arrival, on: :member
    patch :update_departure, on: :member
  end

  resource :search, only: [:new, :show, :create]
  resources :routes, :wagons
  resources :tickets, except: [:edit, :update]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
