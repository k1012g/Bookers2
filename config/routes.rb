Rails.application.routes.draw do
	root to: 'top#top'
	get'/home/about' => 'top#about'
  	devise_for :users
  	resources :users do
  		resource :relationships, only: [:create, :destroy]
	    get :follows, on: :member
	    get :followers, on: :member
  	end
  	resources :books do
  		resources :book_comments, only: [:create, :destroy]
  	end
  	resources :favorites, only: [:destroy, :create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
