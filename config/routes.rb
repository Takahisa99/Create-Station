Rails.application.routes.draw do

  devise_for :users, skip: [:passwords], controllers: {
    registrations: 'public/registrations',
    sessions: 'public/sessions'
  }


  devise_for :admin, skip: [:registrations, :passwords] , controllers: {
    sessions: "admin/sessions"
  }


  root to: 'homes#top'
  get "/about"=>"homes#about"

#ゲストユーザー
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end

#会員
  namespace :public do
    get "/unsubscribe"=>"users#unsubscribe"
    get "/confirm"=>"users#confirm"
    patch "/withdrawal"=>"users#withdrawal"

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

#管理者側

  namespace :admin do
    get "/"=>"users#index"
    resources :users, only: [:index, :show, :edit, :update]
    resources :creates, only:[:index, :show, :edit, :update, :destroy] do
    resources :create_comments, only: [:create, :destroy ]
    end
    resources :genres, only: [:index, :create, :edit, :update, :destroy ]
    #resources :order_details, only: [:update,]
    get  "/searches" => "searches#search"
  end



  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
