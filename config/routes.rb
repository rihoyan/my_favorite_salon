Rails.application.routes.draw do

  root to: 'homes#top'
  get 'manager' => "homes#manager"

  devise_for :salons,skip: :registrations,controllers: {
    sessions: 'salons/sessions',
    passwords: 'salons/passwords',
  }

  devise_for :admins,skip: :registrations,controllers: {
    sessions: 'admins/sessions',
    passwords: 'admins/passwords',
    registrations: 'admins/registrations'
  }

  devise_for :customers,skip: :registrations,controllers: {
    sessions: 'customers/sessions',
    passwords: 'customers/passwords'
  }

  devise_scope :customer do
    post 'customers/guest_sign_in', to: 'customers/sessions#guest_sign_in'
    get 'customers/sign_up', to: 'customers/registrations#new', as: :new_customer_registration
    post 'customers/sign_up', to: 'customers/registrations#create', as: :customer_registration
  end

  scope module: :customers do
    resource :customers, only: [:show, :edit, :update]
    patch 'customers/destroy' => 'customers#destroy'
    get 'customers/destroy' => 'customers#confirm'
    get 'favorites/index' => 'favorites#index'
    resources :salons, only: [:index, :show] do
    resource :favorites, only: [:create, :destroy]
  end
    resources :reservations ,only: [:index, :show,:create] do
      collection do
        get 'step1'
        get 'step2'
        get 'step3'
        get 'step4'
        get 'confirm'
        get 'done'
      end
    end
end

  scope module: :salons do
    get 'salons/index'
    get 'salons/show'
    get 'salons/edit'
  end

  namespace :salons do
    resources :signup do
      collection do
        get 'step1'
        get 'step2'
        get 'step3'
        get 'confirm'
        get 'done'
      end
    end
  end
end
