Rails.application.routes.draw do
  get 'practices/kanji'
	get 'practices/result' => "practices#result"
	post 'practices/add' => "practices#add"
	delete 'practices/delete/:id' => "practices#delete"
	
  get 'weedocs/index' => "weedocs#index"
  get 'weedocs/add'
	post 'weedocs/add' => "weedocs#create"
	get 'weedocs/delete'
	get 'weedocs/search' => "weedocs#search"
  delete 'weedocs/delete/:id' => "weedocs#delete"
	
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
	
	post "blogs/:blog_id/likes/create" => "likes#create"
	post "blogs/:blog_id/likes/destroy" => "likes#destroy"
	
	# post하면 토큰이 필요하네. get하면 https에서 http로 자동으로 가버리네?
	#get "blogs/:blog_id/likes/create" => "likes#create"
	#get "blogs/:blog_id/likes/destroy" => "likes#destroy"
	
	
end
