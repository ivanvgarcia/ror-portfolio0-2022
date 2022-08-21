Rails.application.routes.draw do
  get 'errors/not_found'
  get 'errors/internal_server_error'

  devise_for :users

  get 'pages/home'
  root "pages#home"

  match "/404", to: "errors#not_found", via: :all
  match "/500", to: "errors#internal_server_error", via: :all

  resources :projects

  scope module: :blog, path: :blog do
    resources :posts
  end
end
