class LikesController < ApplicationController
	before_action :check_login
	
  def create
    @like = Like.new(user_id: @login_PID, blog_id: params[:blog_id])
    @like.save
    redirect_to("/blogs/#{params[:blog_id]}")
  end
  
  def destroy
    @like = Like.find_by(user_id: @login_PID, blog_id: params[:blog_id])
    @like.destroy
    redirect_to("/blogs/#{params[:blog_id]}")
  end
	
	#필요없는듯?
	def show
		@likes_count = Like.where(blog_id: @blog.id).count
  	end
	
	private 
	def check_login
		if user_signed_in?
			login_ID = current_user.email
			@login_PID = current_user.id
		else
			login_ID = ""
			@login_PID = 0
		end
	end
	
end
