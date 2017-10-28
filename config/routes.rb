Rails.application.routes.draw do
	root "photos#index"
  devise_for :users
  resources :users
  resources :photos
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
