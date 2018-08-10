Rails.application.routes.draw do
devise_for :users
root "pages#home"

namespace :admin do
  resources :users, only: [:destroy, :index, :edit, :update] do
    member do
      get 'update_status'
      get 'update_role'
    end
  end
end
end
