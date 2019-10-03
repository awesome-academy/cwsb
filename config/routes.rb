Rails.application.routes.draw do

  post "/hook" => "payments#update"

  resource :store_bookings, only: [:show, :update]

  resources :payments
  resources :booking_histories, only: :index
  resources :static_pages, only: :index

  namespace :search do
    resources :spaces
    root to: "spaces#index"
  end

  root "static_pages#index"
  devise_for :admins
  devise_for :users
  resources :bookings
  resources :venues do
    resources :spaces do
      resources :prices
    end
    resources :orders
    resource :venue_detail
    resources :venue_amenities
    resources :amenities do
      resources :service_charges
    end
  end

  resources :static_pages
  resources :notifications, only: :index
  resource  :notifications, only: :update

  mount ActionCable.server => '/cable'
end
