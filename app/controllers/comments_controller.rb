class CommentsController < ApplicationController
	#before_action :check_id, only: %i[create, destroy]

	#@writer = ""
	
	def create
		@blog = Blog.find(params[:blog_id])
		@comment = @blog.comments.create(comment_params)
		redirect_to blog_path(@blog)
	end
	
	def destroy
		@blog = Blog.find(params[:blog_id])
		@comment = @blog.comments.find(params[:id])
		@comment.destroy
		redirect_to blog_path(@blog)
		#if @writer == @comment.writer then
		#	@comment.destroy
		#	redirect_to blog_path(@blog)
		#else
		#	redirect_to "/blogs"
		#end
				
		
	end
	
	private
	def comment_params
		#params.require(:comment).permit(:comment)
		params.require(:comment).permit(:comment, :writer)
	end
	
	#def check_id
	#	if user_signed_in?
	#		@writer = current_user.email
	#	end
	#end
end
