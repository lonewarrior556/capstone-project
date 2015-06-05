Rails.application.routes.draw  do
  post 'email_from_personal_page', to: "responses#email"

  root :to => "questions#root_page"


  get 'users/random', :to => "users#random_sign_up"
  resources :users, only: [:new, :create, :index, :show]

  get 'questions/top', :to => "questions#top"
  get 'questions/unanswered', :to => "questions#unanswered"
  resources :questions

  resources :responses, only: [:create]

  get 'auth/:provider/callback', to: 'sessions#omniauth_callback'
  get 'auth/failure', to: redirect('/')
  resource :sessions, only: [:new, :create, :destroy]
  get 'sessions/search', :to => "sessions#search"

  get 'api_questions/search', :to => "api_questions#search"
  resources :api_questions, only: [:index, :show, :create], defaults: { :format => 'json' } do
    resources :api_responses, only: [:index], defaults: { :format => 'json' }
  end

  resources :api_users, only: [:index, :show], defaults: { :formant => 'json'}
  patch 'api_users/', to: 'api_users#update_current_user'
  put  'api_users/', to: 'api_users#update_current_user'

end
