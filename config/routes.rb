Rails.application.routes.draw do
  root :to => "questions#index"

  resources :users, only: [:new, :create, :index]

  resources :questions


  resource :sessions, only: [:new, :create, :destroy]

end
