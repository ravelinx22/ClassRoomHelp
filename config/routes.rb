Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root :to => "page#index"
  resources :page, only: [:index]
  resources :subject, only: [:index]
  resources :attempt, only: [:show]

  get 'subject/:id/topics' => "subject#topics", as: "subject_topics"
  get 'attempt/:id/check' => "attempt#check_attempt", as: "attempt_check"
end
