Rails.application.routes.draw do
  # ...

  devise_for :users

  root 'pages#home'

  resources :posts
  resources :subscribers
  resources :profiles, only: [:show, :destroy]
  # Ajoutez les routes pour gérer les abonnements et les newsletters

  # Pour afficher la liste des newsletters disponibles
  resources :newsletters, only: [:index, :show]

  # Pour permettre aux utilisateurs de s'abonner et se désabonner
  resources :subscriptions, only: [:create, :destroy]

  # Pour envoyer une newsletter (vous pouvez protéger cette route par exemple)
  post 'newsletters/:id/send', to: 'newsletters#send_newsletter', as: 'send_newsletter'

  # ...
  post '/attachments', to: 'attachments#create'
end
