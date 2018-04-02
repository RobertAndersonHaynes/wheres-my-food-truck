Rails.application.routes.draw do
  root 'homes#index'
  devise_for :users

  resources :users, only: [:index, :show, :destroy, :edit, :update]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
