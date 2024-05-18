Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "homes#top"
  resource :home, only: [] do
    get :about
  end
  get "search" => "searches#search"
  resources :favorites, only: [:index]
  resources :users, except: %i(new create)
  resources :diaries, only: %i(edit index show update new create destroy) do
    resource :favorites, only: [:create, :destroy]
    resources :comments, only: [:create, :destroy, :index]
     collection do
       get 'favorites'
    end
end
  devise_for :admin, skip: [:registrations, :password], controllers: {
    sessions: 'admin/sessions'
  }
  
  devise_scope :user do
    post "users/guest_sign_in", to: "users/sessions#guest_sign_in"
  end


  namespace :admin do
    get 'dashboards', to: 'dashboards#index'
    resources :users, only: [:destroy]
  end
end
