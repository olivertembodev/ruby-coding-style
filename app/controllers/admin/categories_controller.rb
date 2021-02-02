class Admin::CategoriesController < AdminController
  def new
    @admin_category = Category.new
  end

  def create
    @admin_category = Category.new(category_params)

    if @admin_category.save
      respond_to do |format|
        format.html { redirect_to admin_categories_path, flash: { success: 'Department Created Successfully' } }
      end
    else
      render :new
    end
  end

  def index
    @admin_categories = Category.all.order('created_at asc')
  end

  def show
    @admin_category = Category.find(params[:id])
  end

  def edit
    @admin_category = Category.find(params[:id])
  end

  def update
    @admin_category = Category.find(params[:id])

    if @admin_category.update(category_params)
      respond_to do |format|
        format.html { redirect_to admin_categories_path, flash: { success: 'Department Updated Successfully' } }
      end
    else
      render :edit
    end
  end

  def destroy
    @admin_category = Category.find(params[:id])
    @admin_category.destroy

    respond_to do |format|
      format.html { redirect_to admin_categories_path, flash: { success: 'Department Deleted Successfully' } }
    end
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end
end
