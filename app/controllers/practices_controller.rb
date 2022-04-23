class PracticesController < ApplicationController
  def kanji
  end
	
	def result
		@practices = Practice.all.order(:created_at)
	end
	
	def add
		if user_signed_in?
			Practice.create(name: current_user.email + "," + params[:name], result: params[:result])
		elsif
			Practice.create(name: params[:name], result: params[:result])
		end
		redirect_to "/"
	end
	
	def delete
		practice = Practice.find(params[:id])
	  	practice.destroy
		redirect_to "/"
		
	end
end
