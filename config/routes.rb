Rails.application.routes.draw do

  devise_for :users
  root to: 'homes#top'
  get "/about"=>"homes#about"


  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end


  namespace :public do

    resources :users, only:[:index, :show, :create, :edit, :update ] do
      member do
        get :favorites
      end

      # get "users/:id/favorites" => "users#favorites"
    end
    resources :creates, only:[:index, :new, :show, :create, :edit, :update, :destroy] do
     resources :create_comments, only: [:create, :destroy ]
     resources :favorites, only:[:create, :destroy, :index ]

    end
    get  "/searches" => "searches#search"


  end


  namespace :admin do
    get 'index/edit'
    get 'index/show'
  end






  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
