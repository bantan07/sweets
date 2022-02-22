Rails.application.routes.draw do
  devise_for :admins, path: 'admin', skip: [:registrations, :passwords], controllers: {
    sessions: 'admin/sessions'
  }
  devise_for :users, controllers: {
    sessions: "users/sessions",
    registrations: "users/registrations"
  }
  namespace :admin do
    root to: 'homes#top'
    resources :users, only:[:index, :show, :edit, :update]
  end
  
  root to: "homes#top"
  resources :sweets_shops, except: [:edit, :update] do
    resources :comments, only: [:create, :destroy]
    # resources :likes, only: [:create, :destroy]
    post 'like', to: 'likes#like'
    delete 'unlike', to: 'likes#unlike'
  end
  get 'search' => 'sweets_shops#search'
  patch "users/withdraw" =>"users#withdraw",as:"withdraw"
  resources :users, only: [:create, :show, :update] 
  get "user/edit" =>"users#edit"
  get "mypage" =>"mypages#index"
  get "mypage/likes" =>"mypages#show"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
