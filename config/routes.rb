Rails.application.routes.draw do
  root 'static_pages#top'
  get 'terms', to: 'static_pages#terms'
  get 'policy', to: 'static_pages#policy'

  get 'login', to: 'user_sessions#new'

  resources :users, only: %i[new]
  resources :boards, only: %i[index new show edit]
end
