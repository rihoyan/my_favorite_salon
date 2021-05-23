Rails.application.routes.draw do

  root to: 'homes#top'
  get "manager" => "homes#manager"

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

  devise_for :customers,controllers: {
    sessions: 'customers/sessions',
    passwords: 'customers/passwords',
    registrations: 'customers/registrations'
  }

  devise_scope :customer do
    post 'customers/guest_sign_in', to: 'customers/sessions#guest_sign_in'
  end

  scope module: :customers do
    resource :customers, only: [:show]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
