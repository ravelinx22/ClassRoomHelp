Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root :to => "page#index"
  resources :page, only: [:index]
  resources :subject, only: [:index]
  resources :attempt, only: [:show]

  get 'subject/:id/topics' => "subject#topics", as: "subject_topics"
  get 'attempt/:id/check' => "attempt#check_attempt", as: "attempt_check"
  get 'attempt/:id/feedback' => "attempt#feedback", as: "attempt_feedback"
  get 'attempt/:id/try_again' => "attempt#try_more_exercises", as: "attempt_try_more_exercises"
end
