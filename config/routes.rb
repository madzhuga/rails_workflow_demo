Rails.application.routes.draw do
  resources :orders do
    resources :order_lines
  end

  resources :products

  root to: 'visitors#index'
  devise_for :users
  resources :users

  mount Workflow::Engine => '/workflow', as: 'workflow'
end
