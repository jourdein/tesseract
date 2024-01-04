# frozen_string_literal: true

Rails.application.routes.draw do
  resources :rooms do
    resources :messages
  end

  resources :tickers, except: %i[update edit]
  scope :search do
    get :documents, to: 'search#documents'
  end

  mount Lookbook::Engine, at: '/lookbook' if Rails.env.development?

  # Defines the root path route ("/")
  # root "articles#index"
end
