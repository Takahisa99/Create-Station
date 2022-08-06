Rails.application.routes.draw do

  root to: 'home#top'
  devise_for :users

  namespace :users do

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
