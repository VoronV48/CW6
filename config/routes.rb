Rails.application.routes.draw do
  ActiveAdmin.routes(self)
	root "photos#index"
  devise_for :users
  resources :users
  resources :photos
     resources :comments
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
