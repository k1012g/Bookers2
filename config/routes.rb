Rails.application.routes.draw do
  root to: 'top#top'
  get'/home/about' => 'top#about'
	devise_for :users, controllers: {
        sessions: 'users/sessions',
        registrations: 'users/registrations'
      }

	resources :users do
		resource :relationships, only: [:create, :destroy]
    get :follows, on: :member
    get :followers, on: :member
    get '/following' => 'users#following', as: 'following'
    get '/follower' => 'users#follower', as: 'follower'
	end
	resources :books do
		resources :book_comments, only: [:create, :destroy]
		resource :favorites, only: [:destroy, :create]
	end
  get '/search' => 'search#search', as: 'search'
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
