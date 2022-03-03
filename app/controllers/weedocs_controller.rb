class WeedocsController < ApplicationController
	before_action :set_weedoc, only: [:delete]
	
  def index
	  @weedocs = Weedoc.all
  end

  def add
	 @weedoc = Weedoc.new
	  
  end

	def create
		@weedoc = Weedoc.new(weedoc_params)
	
		respond_to do |format|
      		if @weedoc.save
				format.html { redirect_to weedocs_index_path, notice: 'successfully created.' }
				#format.json { render :show, status: :created, location: @blog }
			else
				format.html { render :new }
				#format.json { render json: @blog.errors, status: :unprocessable_entity }
			end
		end
	end
	
  def delete
	  @weedoc.destroy
	  
  end
	
	private 
	def set_weedoc
		@weedoc = Weedoc.find(params[:id])
	end
	
	def weedoc_params
		params.require(:weedoc).permit(:category, :organ, :sign1, :sign2, :strong, :cause, :expect)
	end
		
end
