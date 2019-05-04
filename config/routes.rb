Rails.application.routes.draw do
  devise_for :users
  get "/admin", to: "admin/base#home", :as => "admin"
  root "static_pages#home"

  namespace :admin do
    resources :users
    resources :entries
    # resources :comments
  end
  resources :entries do
    resources :comments
  end
end
