Rails.application.routes.draw do
  get 'user/new'
  root 'pages#home'
  get '/about', to: 'pages#about'
  resources :articles
  get 'signup', to: 'users#new'
  resources :users, except: %i[:new]
end
