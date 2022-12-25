Rails.application.routes.draw do
  devise_for :users
  devise_for :admins, controllers: {
    sessions: 'admin/sessions'
  }

  namespace :admin do
    get    '/',        to: 'home#index'
    resources :users
    resources :profile, only: %i[index update] do
      collection do
        get 'password'
        put 'update_password'
      end
    end
  end
  mount Sidekiq::Web => '/sidekiq'

  get 'home/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "home#index"
end
