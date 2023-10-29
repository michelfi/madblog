Rails.application.routes.draw do
  get 'profiles/show'
  get 'pages/home'
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root 'pages#home'
  resources :posts
  get 'profile', to: 'profiles#show'

  delete 'posts/:id', to: 'posts#destroy', as: 'post_destroy'
end
