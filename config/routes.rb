Rails.application.routes.draw do
  resources :clients
  devise_for :users
  root "pages#home"

  resources :projects do
    member do
     get 'all_payments'
     get 'all_time_logs'
    end
    resources :payments, except: [:index, :show]
    resources :time_logs, except: [:index, :show]
  end

  namespace :admin do
    resources :users, only: [:destroy, :index, :edit, :update] do
      member do
        patch 'update_status'
        patch 'update_role'
      end
    end
  end
end
