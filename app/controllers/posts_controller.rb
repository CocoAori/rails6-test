class PostsController < ApplicationController
	protect_from_forgery :only => ["create"]
	
  def index
	  @posts = Post.all
  end

  def new
  end

  def create
	  post=Post.create(title: params[:title], content: params[:content])
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
	  post.destroy
	  redirect_to "/posts/index"
  end
end
