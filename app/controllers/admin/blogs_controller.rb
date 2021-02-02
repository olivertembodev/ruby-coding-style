class Admin::BlogsController < AdminController
  before_action :set_admin_blog, only: [:show, :edit, :update, :destroy]

  # GET /admin/blogs
  # GET /admin/blogs.json
  def index
    @admin_blogs = Blog.all.order('created_at asc')
  end

  # GET /admin/blogs/1
  # GET /admin/blogs/1.json
  def show; end

  # GET /admin/blogs/new
  def new
    @admin_blog = Blog.new
  end

  # GET /admin/blogs/1/edit
  def edit; end

  # POST /admin/blogs
  # POST /admin/blogs.json
  def create
    @admin_blog = Blog.new(admin_blog_params)
    @admin_blog.author = current_user

    respond_to do |format|
      if @admin_blog.save
        format.html { redirect_to admin_blogs_url, flash: { success: 'Blog Created Successfully' } }
        format.json { render :show, status: :created, location: @admin_blog }
      else
        format.html { render :new }
        format.json { render json: @admin_blog.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/blogs/1
  # PATCH/PUT /admin/blogs/1.json
  def update
    respond_to do |format|
      if @admin_blog.update(admin_blog_params)
        format.html { redirect_to admin_blogs_url, flash: { success: 'Blog Updated Successfully' } }
        format.json { render :show, status: :ok, location: @admin_blog }
      else
        format.html { render :edit }
        format.json { render json: @admin_blog.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/blogs/1
  # DELETE /admin/blogs/1.json
  def destroy
    @admin_blog.destroy
    respond_to do |format|
      format.html { redirect_to admin_blogs_url, flash: { success: 'Blog Deleted Successfully' } }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_admin_blog
    @admin_blog = Blog.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def admin_blog_params
    params.require(:blog).permit(:title, :description, :image, :user_id)
  end
end
