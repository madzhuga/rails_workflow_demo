Rails.application.routes.draw do
  resources :orders do
    resources :order_lines
  end

  resources :products

  root to: 'visitors#index'
  devise_for :users
  resources :users

  get "/tasks", to: "users#tasks"

  mount RailsWorkflow::Engine => '/workflow', as: 'workflow'
end
