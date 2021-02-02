class BlogsController < ApplicationController
  include Pagination

  def index
    @blogs = Blog.ransack(query)
                 .result(distinct: true)
                 .order(order)
                 .page(page)
                 .per_page(per_page)
  end

  def show
    @blog = Blog.find(params[:id]).try(:decorate)
  end
end
