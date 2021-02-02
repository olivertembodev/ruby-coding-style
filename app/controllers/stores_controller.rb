class StoresController < ApplicationController
  include Pagination

  def index
    @search = Store.ransack query
    @stores = @search.result(distinct: true)
    @stores = @stores.order(reward: params[:sort_type]) if params[:sort_type].present?
    @stores = @stores.approved_stores.paginate(page: page)

    @categories = Category.all
    url = 'https://api.coingecko.com/api/v3/simple/price?ids=bitcoin%2Cethereum&vs_currencies=usd%2Ccad'
    response = RestClient.get url
    @data = JSON.parse response
    @bitcoin = @data['bitcoin']

    respond_to do |format|
      format.html
      format.js
    end
  end

  def new
    @store = Store.new
  end

  def create
    @store = Store.new(store_params)

    if @store.save
      redirect_to home_index_path
    else
      flash.now[:error] = 'Unable to save store'
      render :new
    end
  end

  private

  def store_params
    params.require(:store).permit(:name, :reward, :url, :affiliate_name, :affiliate_id, :approve, :main_image, category_ids: [])
  end

  def query
    attrs = { name_cont: params[:query] }
    attrs.merge!({ categories: { id: params[:cat_id] } }) if params[:cat_id].present?
    attrs
  end
end
