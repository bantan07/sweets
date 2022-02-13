Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: "users/sessions",
    registrations: "users/registrations"
  }
  root to: "homes#top"
  resources :sweets_shops, except: [:edit]
  get "mypages" => "mypages#index"
  get "mypages/:id" => "mypages#show"
  get "mypages/edit" => "mypages#edit"
  patch "mypages" => "mypages/update"
  patch "/mypages/withdraw" => "mypages#withdraw"
  resources :likes, only: [:create, :delete]
  resources :comments, only: [:create, :delete]
  resources :users, only: [:show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
