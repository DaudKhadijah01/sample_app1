Rails.application.routes.draw do
     scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do
     resources :users
     root 'static_pages#home'
     get 'static_pages/help'
     get 'static_pages/contact'
     get 'static_pages/index'
  end
end
