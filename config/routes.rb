Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: "users/sessions",
    registrations: "users/registrations"
  }
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
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
