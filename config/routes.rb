Rails.application.routes.draw do
  root "pages#home"
  devise_for :users
  
  namespace :api do
    namespace :v1 do
      post :auth, to: "authentication#create"
      resources :projects
      resources :clients
    end
  end
  
  resources :clients

  resources :projects do
  resources :payments, except: [:show]
  resources :time_logs, except: [:show]
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
