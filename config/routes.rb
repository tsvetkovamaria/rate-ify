Rails.application.routes.draw do
  get 'pictures/new'

  get 'pictures/create'

  root "places#index"

  match "places/:id/" => "places#save_picture", :via => :post, :as => :picture
  # match "places/:id/" => "places#save_review", :via => :post, :as => :review

  post 'reviews/:id' => "places#save_review", :via => :post, :as => :reviews

  # post 'pictures/:id' => "places#save_picture", :via => :post, :as => :pictures


  devise_for :admin_users, ActiveAdmin::Devise.config
  devise_for :users

  ActiveAdmin.routes(self)
 
  resources :places

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
