Rails.application.routes.draw do
  resources :projects
  resources :clients
  devise_for :users
  root "pages#home"

  namespace :admin do
    resources :users, only: [:destroy, :index, :edit, :update] do
      member do
        patch 'update_status'
        patch 'update_role'
      end
    end
  end
end
