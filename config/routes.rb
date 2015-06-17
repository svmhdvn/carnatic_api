Rails.application.routes.draw do
  resources :users, except: [:index, :show, :new, :edit] do
    resources :korvais, only: [:index]
    resource :profile, only: [:show]
  end

  post 'users/login', to: 'users#login'

  resources :korvais, only: [:show, :create, :update, :destroy]
  resources :profiles, only: [:update, :destroy]
end
