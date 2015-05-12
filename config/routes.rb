Rails.application.routes.draw do
  root :to => "users#index"
  resources :users
  # delete 'session' => 'sessions#destroy'
  resource :sessions, only: [:new, :create, :destroy]

end
