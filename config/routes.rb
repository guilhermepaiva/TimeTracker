Rails.application.routes.draw do
  devise_for :users
  get 'accounts/new'

  get 'accounts/create'

  get 'welcome/index'

  root "welcome#index"

  resources :accounts
end
