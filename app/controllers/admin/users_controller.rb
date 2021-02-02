class Admin::UsersController < AdminController
  def new
    @user = User.new
  end

  def create
    new_params = change_params

    if params[:user][:password].blank?
      generated_password = 'password987099'
      new_params = change_params.merge(password: generated_password, password_confirmation: generated_password)
    end

    @user = User.new(new_params)

    if @user.save
      respond_to do |format|
        format.html { redirect_to admin_users_path, flash: { success: 'User Created Successfully' }}
      end
    else
      render :new
    end
  end

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      respond_to do |format|
        format.html { redirect_to admin_users_path, flash: { success: 'User Updated Successfully' } }
      end
    else
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to admin_users_path, flash: { success: 'User Deleted Successfully' } }
    end
  end

  private

  def change_params
    return user_params.to_h.merge!(password: params[:user][:password]) if params[:user][:password].present?

    user_params
  end

  def user_params
    params.require(:user).permit(:name, :email, :phone, :wallet_address, :ticker, role_ids: [])
  end
end
