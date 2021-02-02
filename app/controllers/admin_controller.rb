class AdminController < ApplicationController
  include Pagination

  before_action :authenticate_user!
  before_action :admin?

  def index
    @stores = Store.all
    @categories = Category.all
    @users = User.all
  end

  def admin?
    return if current_user&.has_role?(:admin)

    redirect_to root_path, notice: 'Some message'
  end
end
