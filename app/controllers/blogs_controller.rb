class BlogsController < ApplicationController
  before_action :must_logged_in, only: %i[index new edit show destroy]
  before_action :set_blog, only: [:show, :edit, :update, :destroy]

  def index
    @blogs = Blog.all
  end

  def show
    @favorite = current_user.favorites.find_by(blog_id: @blog.id)
  end

  def new
    @blog = Blog.new
  end

  def edit
  end

  def create
    @blog = current_user.blogs.new(blog_params)

    respond_to do |format|
      if @blog.save
        PostedcompletionMailer.postedcompletion_mail(@blog).deliver
        format.html { redirect_to @blog, notice: 'Insta was successfully created.' }
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
        format.html { redirect_to @blog, notice: 'Insta was successfully updated.' }
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
    @blog.destroy
    respond_to do |format|
      format.html { redirect_to blogs_url, notice: 'Insta was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def confirm
    @blog = current_user.blogs.new(blog_params)
    render :new if @blog.invalid?
  end


  private
  # Use callbacks to share common setup or constraints between actions.
  def set_blog
    @blog = Blog.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def blog_paramSs
    params.require(:blog).permit(:picture, :content, :picture_cache)
  end

  def must_logged_in
    redirect_to new_session_path unless logged_in?
  end
end
