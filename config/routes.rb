Rails.application.routes.draw do
  devise_for :users
  resources :quacks
  root :to => 'quacks#index'
end
