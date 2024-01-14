# frozen_string_literal: true
require 'sidekiq/web'

Rails.application.routes.draw do
  resources :rooms do
    resources :messages
  end

  resources :tickers, except: %i[update edit]

  scope :search do
    get :documents, to: 'search#documents'
  end

  mount Lookbook::Engine, at: '/lookbook' if Rails.env.development?
  mount Sidekiq::Web => '/sidekiq'

  # Defines the root path route ("/")
  # root "articles#index"
end
