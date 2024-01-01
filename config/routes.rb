Rails.application.routes.draw do
  resources :rooms do
    resources :messages
  end

  resources :tickers, except: [:update, :edit]

  if Rails.env.development?
    mount Lookbook::Engine, at: "/lookbook"
  end

  # Defines the root path route ("/")
  # root "articles#index"
end
