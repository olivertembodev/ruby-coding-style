class ProfilesController < ApplicationController
  def edit
    @user = current_user.decorate
    @section = params[:section]

    if @section.blank?
      render :show
    else
      respond_to do |format|
        format.html { render @section, layout: 'simple' }
      end
    end
  end

  def show
    @user = current_user.decorate
  end

  def update
    @user = current_user.decorate
    @section = params[:section]

    if @user.update(user_params)
      respond_to do |format|
        format.html { render :show }
        format.json { render json: { success: true }, status: :ok }
      end
    else
      respond_to do |format|
        if @section.blank? || @section == :avatar
          format.html { render :show, notice: 'Please check your data' }
        else
          format.html { render @section, notice: 'Please check your data', layout: 'simple' }
        end

        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :wallet_address,
                                 :phone, :password, :password_confirmation,
                                 :show_live_ticker, :avatar)
  end
end
