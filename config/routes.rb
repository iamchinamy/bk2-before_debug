Rails.application.routes.draw do
  root 'home#top'
  get 'home/about' => 'home#about'

  devise_for :users

  resources :users, only: [:show, :index, :edit, :update] do
	  resource :relationships, only: [:create, :destroy]
    get :followings, on: :member
    get :followers, on: :member
  end
  
  resources :books do
  	resources :book_comments, only: [:create, :destroy]
  	resource :favorites, only: [:create, :destroy]
  end

  get 'search' => 'searches#search'

end