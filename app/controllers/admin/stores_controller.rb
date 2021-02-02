class Admin::StoresController < AdminController
  def index
    @admin_stores = Store.all.order('created_at asc')
  end

  def new
    @admin_store = Store.new
  end

  def create
    @admin_store = Store.new(store_params)

    if @admin_store.save
      respond_to do |format|
        format.html { redirect_to admin_stores_path, flash: {success: 'Store Created Successfully'}}
      end
    else
      render :new
    end
  end

  def show
    @admin_store = Store.find(params[:id])
  end

  def edit
    @admin_store = Store.find(params[:id])
  end

  def update
    @admin_store = Store.find(params[:id])

    if @admin_store.update(store_params)
      respond_to do |format|
        format.html { redirect_to admin_stores_path, flash: { success: 'Store Updated Successfully' } }
      end
    else
      render :edit
    end
  end

  def destroy
    @admin_store = Store.find(params[:id])
    @admin_store.destroy

    respond_to do |format|
      format.html { redirect_to admin_stores_path, flash: {success: 'Store Deleted Successfully'} }
    end
  end

  private

  def store_params
    params.require(:store).permit(:name, :reward, :url, :affiliate_name, :affiliate_id, :approve, :main_image, category_ids: [])
  end
end
