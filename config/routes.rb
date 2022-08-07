Rails.application.routes.draw do

  devise_for :users

  root to: 'homes#top'
  post '/homes/guest_sign_in', to: 'homes#guest_sign_in'

  namespace :public do
    resources :users, only:[:index, :show, :create, :edit, :update ]
    resources :creates, only:[:index, :new, :show, :create, :edit, :update, :destroy]
    resources :creates_comments, only: [:index, :show, :create]
    resources :favorites, only:[:show, :index]
  end


  namespace :admin do
    get 'index/edit'
    get 'index/show'
  end






  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
