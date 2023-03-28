Rails.application.routes.draw do
  root 'static_pages#top'
  get 'terms', to: 'static_pages#terms'
  get 'policy', to: 'static_pages#policy'

  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy'

  get 'users', to: 'users#new'
  resources :users, only: %i[new create]
  resources :boards do
    collection do
      get :bookmarks
    end
  end
  resources :categories
  resources :bookmarks, only: %i[create destroy]
end
