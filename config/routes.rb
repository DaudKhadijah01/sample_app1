Rails.application.routes.draw do
  scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do

    get 'home/index'
    resources :posts
    root 'static_pages#home', as: "home"
    get "/help", to: "static_pages#help", as: "help"
    get "/contact", to: "static_pages#contact", as: "contact"

    get "/signup", to: "users#new"
    post "/signup", to: "users#create"
    resources :users, only: %i(show new create)

    get "/login", to: "sessions#new"
    post "/login", to: "sessions#create"
    delete "/logout", to: "sessions#destroy"

    resources :users do
      member do
        get :following, :followers
      end
    end
    resources :account_activations, only: %i(edit)
    resources :password_resets, only: %i(new create edit update)
    resources :microposts, only: %i(create destroy)
    resources :relationships, only: %i(create destroy)
  end
end
