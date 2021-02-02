class HomeController < ApplicationController
  include Pagination

  def index
    @stores = Store.ransack(query)
                   .result(distinct: true)
                   .order(order)
                   .page(page)
                   .per_page(per_page)

    @store = Store.new
  end
end
