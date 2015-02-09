Rails.application.routes.draw do
  root to: 'visitors#index'
  devise_for :users
  resources :users

  mount Workflow::Engine => '/workflow', as: 'workflow'
end
