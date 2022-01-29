class PostsController < ApplicationController
	protect_from_forgery :only => ["create"]
	#protect_from_forgery except: :create
	
  def index
	  @posts = Post.all
  end

  def new
  end

  def create
	if user_signed_in?
		writer = current_user.email
	end
	  post=Post.create(title: params[:title], content: params[:content], writer: writer)
	  redirect_to "/posts/show/#{post.id}"
  end

  def show
	  @post = Post.find(params[:id])
  end

  def edit
	  @post = Post.find(params[:ids])
  end

  def update
	  post = Post.find(params[:id])
	  post.update(title: params[:title], content: params[:content])
	  redirect_to "/posts/show/#{post.id}"
  end

  def destroy
	  post = Post.find(params[:id])
	  
	  if user_signed_in?
	  	if post.writer == current_user.email
		  post.destroy
		  redirect_to "/posts/index"
	  	else
		end
		  
	  end
  end
end
