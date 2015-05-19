Rails.application.routes.draw  do
  root :to => "questions#top"

  resources :users, only: [:new, :create, :index, :show]

  get 'questions/unanswered', :to => "questions#unanswered"
  resources :questions

  resources :responses, only: [:create]


  resource :sessions, only: [:new, :create, :destroy]

  resources :api_questions, defaults: { :format => 'json' } do
    resources :api_responses, only: [:index], defaults: { :format => 'json' }
  end

  resources :api_users, defaults: { :formant => 'json'}


end
