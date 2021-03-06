Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  devise_scope :user do
    post 'users/sign_up/confirm', to: 'users/registrations#confirm'
    get 'users/sign_up/complete', to: 'users/registrations#complete'
  end

  root to: "invitations#index"
  resources :receptions, only:[:index]
  resources :seatinglists, only:[:index]
  resources :photos, only:[:index,:new,:create,:edit,:update,:destroy]
  resources :profiles, only:[:index]
  resources :menus, only:[:index]
end
