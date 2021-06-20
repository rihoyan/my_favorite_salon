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
    resource :customers, only: [:show, :edit, :update, :create]
    patch 'customers/destroy' => 'customers#destroy'
    get 'customers/destroy' => 'customers#confirm'
    get 'favorites/index' => 'favorites#index'
    get 'customers/prf_image' =>'customers#prf_image'
    resources :reservations ,only: [:index, :show, :create, :update] do
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

  namespace :customers do
    resources :salons, only: [:index, :show] do
      resource :favorites, only: [:create, :destroy]
    end
    resources :images , only: [:index] do
      post 'add' => 'likes#create'
      delete '/add' => 'likes#destroy'
    end
    resources :likes , only: [:index]
    resources :order_details, only: [:show]
  end

  namespace :salons do
    resources :signup , only: [:create] do
      collection do
        get 'step1'
        get 'step2'
        get 'confirm'
        get 'done'
      end
    end
    resources :menus, except: [:show]
    resources :images, except: [:show, :edit, :update,:new]
    resources :reservations, only: [:index, :show]
    resources :order_details, only: [:create, :show]
    get 'order_details/new/:id' => 'order_details#new'
    resource :salons, only: [:edit, :update, :create]
    get 'salons/prf_image' => 'salons#prf_image'

  end
end
