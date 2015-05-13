Rails.application.routes.draw do
  root :to => "questions#top"

  resources :users, only: [:new, :create, :index, :show]

  get 'questions/unanswered', :to => "questions#unanswered"
  resources :questions

  resources :responses, only: [:create]


  resource :sessions, only: [:new, :create, :destroy]

end
