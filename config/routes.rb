Rails.application.routes.draw do
  devise_for :users
  resources :posts do
    member do
      get :toggle_status
    end
  end

  get 'posts/:id', to: 'posts#show'

  get 'about', to: 'pages#about'
  get 'contact', to: 'pages#contact'
  
  root to: 'pages#home'
end
