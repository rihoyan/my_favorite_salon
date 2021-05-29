Rails.application.routes.draw do

  root to: 'homes#top'
  get 'manager' => "homes#manager"


  devise_for :admins,controllers: {
    sessions: 'admins/sessions',
    passwords: 'admins/passwords',
    registrations: 'admins/registrations'
  }

  devise_for :salons,controllers: {
    sessions: 'salons/sessions',
    passwords: 'salons/passwords',
    registrations: 'salons/registrations'
  }

  devise_for :customers,skip: :registrations,controllers: {
    sessions: 'customers/sessions',
    passwords: 'customers/passwords'
  }

  devise_scope :customer do
    post 'customers/guest_sign_in', to: 'customers/sessions#guest_sign_in'
    get 'signup', to: 'customers/registrations#new', as: :new_customer_registration
    post 'signup', to: 'customers/registrations#create', as: :customer_registration
  end

  scope module: :customers do
    resource :customers, only: [:show, :edit, :update]
    patch 'customers/destroy' => 'customers#destroy'
    get 'customers/destroy' => 'customers#confirm'
  end

end
