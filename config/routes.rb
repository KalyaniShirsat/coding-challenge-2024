Rails.application.routes.draw do
  resources :orders
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  # Defines the root path route ("/")
  root "orders#index"
  resources :messages, only: [:create]
  resources :support_messages, only: [:create]
end
