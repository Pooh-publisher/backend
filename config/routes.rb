Rails.application.routes.draw do
  devise_for :users
  resources :books do
    resources :sections
  end

  root to: 'static_pages#show', id: "home"

  resources :static_pages, only: [:show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

