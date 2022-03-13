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
	
	def search
		 @wee_category = Weedoc.select(:category).distinct 
		 @wee_organ = Weedoc.where(category: params[:category]).select(:organ, :category).distinct
		 @wee_sign1 = Weedoc.where(category: params[:category], organ: params[:organ]).select(:sign1, :organ).distinct
		 @wee_sign2 = Weedoc.where(category: params[:category], organ: params[:organ], sign1: params[:sign1]).select(:sign2,:sign1, :organ).distinct
		 @wee_strong = Weedoc.where(category: params[:category], organ: params[:organ], sign1: params[:sign1], sign2: params[:sign2]).select(:strong,:sign2,:sign1, :organ).distinct
		 @wee_cause = Weedoc.where(category: params[:category], organ: params[:organ], sign1: params[:sign1], sign2: params[:sign2],strong: params[:strong]).select(:cause, :expect,:strong,:sign2,:sign1, :organ)
		 @wee_expect = Weedoc.where(cause: params[:cause]).select(:expect).distinct
		 @wee_hash = weedoc_course
	end
	
	private 
	def set_weedoc
		@weedoc = Weedoc.find(params[:id])
	end
	
	def weedoc_params
		params.require(:weedoc).permit(:category, :organ, :sign1, :sign2, :strong, :cause, :expect)
	end
	
	def weedoc_course
		if !@wee_hash
			@wee_hash={}
		else
			wee_hash = @wee_hash
			if params
				wee_hash[:category] = params[:category]
				wee_hash[:organ] = params[:organ]
				wee_hash[:sign1] = params[:sign1]
				wee_hash[:sign2] = params[:sign2]
				wee_hash[:strong] = params[:strong]
			end
		end
		return wee_hash
	end
		
end
