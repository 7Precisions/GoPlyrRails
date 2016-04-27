Rails.application.routes.draw do
  # devise_for :users
  root to: 'application#home'
  get '/profile' => 'application#profile'
  get '/:id' => 'application#home'

  get '/auth/:provider/callback', to: 'sessions#create'
end