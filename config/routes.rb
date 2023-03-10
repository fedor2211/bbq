Rails.application.routes.draw do
  resources :subscriptions
  devise_for :users,
             controllers: { omniauth_callbacks: "users/omniauth_callbacks" }
  root to: "events#index"

  resources :events do
    resources :comments
    resources :subscriptions, only: %i[create destroy]
    resources :photos, only: %i[create destroy]
  end
  resources :users, only: %i[show edit update]
end
