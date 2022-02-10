Rails.application.routes.draw do
  resources :blogs do
	  resources :comments
  end
	
  devise_for :users
	root "posts#index"
  get 'posts/index'
  get 'posts/new' => "posts#new"
  post 'posts/create' => "posts#create"
  get 'posts/show/:id' => "posts#show"
  get 'posts/edit/:ids' => "posts#edit"
  post 'posts/update/:id' => "posts#update"
  #get 'posts/destroy/:id' => "posts#destroy"
	delete 'posts/destroy/:id' => "posts#destroy"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
	get 'blogs/:id/chu' => "blogs#chu"
end
