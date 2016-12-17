Rails.application.routes.draw do

  root "places#index"

  match "places/:id/" => "places#save_picture", :via => :post, :as => :picture

  post 'reviews/:id' => "places#save_review", :via => :post, :as => :reviews

  # get "places/category/:id" => "places#show_by_category", :as => :categorized_places

  devise_for :admin_users, ActiveAdmin::Devise.config
  devise_for :users

  ActiveAdmin.routes(self)
 
  resources :places

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
