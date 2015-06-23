Rails.application.routes.draw do
  resources :users, except: [:index, :show, :new, :edit] do
    resources :korvais, only: [:index]
    resource :profile, only: [:show]

    get 'followers', to: 'followings#followers'
    get 'followings', to: 'followings#followings'
  end

  post 'users/login', to: 'users#login'

  resources :korvais, only: [:show, :create, :update, :destroy]
  resources :profiles, only: [:update, :destroy]
  scope 'followings' do
    post ':followee_id', to: 'followings#create'
    delete ':followee_id', to: 'followings#destory'
  end
end
