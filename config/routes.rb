Rails.application.routes.draw do
  resources :posts
  get 'posts/:id', to: 'posts#show'

  get 'about', to: 'pages#about'
  get 'contact', to: 'pages#contact'
  
  root to: 'pages#home'
end
