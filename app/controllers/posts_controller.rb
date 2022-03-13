class PostsController < ApplicationController
	protect_from_forgery :only => ["create"]
	#protect_from_forgery except: :create
	
  def index
	  #@posts = Post.all
	  @posts = Post.all.order(:created_at)
  end

  def new
  end

  def create
	if user_signed_in?
		writer = current_user.email
	elsif
		if params[:post_pw] == "1234" && params[:scret] == "3" && params[:language] == "on"
			writer = "aaa@aaa.aaa"
		else
			writer = "wrong"
		end
	end
	  
	  if writer == "aaa@aaa.aaa"
	  	post=Post.create(title: params[:title], content: params[:content], writer: writer)
	  	redirect_to "/posts/show/#{post.id}"
	  end
	  
  end

  def show
	  @post = Post.find(params[:id])
  end

  def edit
	  #if user_signed_in? && current_user.email == "aaa@aaa.aaa"
	  	@post = Post.find(params[:ids])
	  #elsif

	  #end
  end

  def update
	  post = Post.find(params[:id])
	  post.update(title: params[:title], content: params[:content])
	  redirect_to "/posts/show/#{post.id}"
  end

  def destroy
	  if user_signed_in?
		post = Post.find(params[:id])
	  	if post.writer == current_user.email
		  post.destroy
		  redirect_to "/posts/index"
	  	else
		end
		  
	  end
  end
end
