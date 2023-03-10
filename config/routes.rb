Rails.application.routes.draw do
  scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do
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
    post 'exam/exam_update'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  end
end
