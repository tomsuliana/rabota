Rails.application.routes.draw do
  resources :variants
  resources :questions
  get 'admin/panel'
  get 'admin/control_users'
  get 'admin/control_questions'
  get 'exam/cabinet'
  get 'exam/exam_process'
  get 'exam/exam_result'
  root "session#login"
  post 'session/authorize'
  get 'session/logout'
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
