Rails.application.routes.draw do




  resources :posts
  
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  authenticated :user do
    root 'posts#index', as: :authenticated_root
  end
  

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)



end

