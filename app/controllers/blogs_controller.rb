class BlogsController < ApplicationController
  before_action :set_blog, only: [:show, :edit, :update, :destroy, :chu]
  # GET /blogs
  # GET /blogs.json
	
	#20220220 form으로 delete하려고하면 토큰 에러나네
	protect_from_forgery :only => ["delete"]
	
  def index
    #@blogs = Blog.all
	#@blogs = Blog.all.order(created_at: "ASC")
	@blogs = Blog.all.order(:created_at)
  end

  # GET /blogs/1
  # GET /blogs/1.json
  def show
  end

  # GET /blogs/new
  def new
    @blog = Blog.new
  end

  # GET /blogs/1/edit
  def edit
	  #20220221로그인안한 사람 비번 확인
	  if @blog.passwd == params[:pw_check]
	  else
		  #redirect_to :back
		  redirect_to blogs_path
	  end
  end

  # POST /blogs
  # POST /blogs.json
  def create
    @blog = Blog.new(blog_params)

    respond_to do |format|
      if @blog.save
        format.html { redirect_to blogs_path, notice: 'Blog was successfully created.' }
        format.json { render :show, status: :created, location: @blog }
      else
        format.html { render :new }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /blogs/1
  # PATCH/PUT /blogs/1.json
  def update
    respond_to do |format|
      if @blog.update(blog_params)
        format.html { redirect_to @blog, notice: 'Blog was successfully updated.' }
        format.json { render :show, status: :ok, location: @blog }
      else
        format.html { render :edit }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /blogs/1
  # DELETE /blogs/1.json
  def destroy
    #20220221 삭제전 패스워드 확인 
	respond_to do |format| 
	  if @blog.passwd == params[:pw_check] 
		@blog.destroy
    	format.html { redirect_to blogs_url, notice: 'Blog was successfully destroyed.' }
      	format.json { head :no_content }
	  else #추가부분
		format.html { redirect_to @blog, alert: 'Failed to delete.' }
        format.json { render :show, @blog.errors, status: :unprocessable_entity }
	  end 
    end
  end


	
	##
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_blog
      @blog = Blog.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def blog_params
      	#20220220작성자 추가
		#params.require(:blog).permit(:title, :description)
		params.require(:blog).permit(:title, :description, :writer, :passwd)	
    end
	
end
