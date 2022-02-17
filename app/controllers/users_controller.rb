class UsersController < ApplicationController
 before_action :authenticate_user!

  def show
    @user = User.find(params[:id])
    @sweets_shop = SweetsShop.new
    @sweets_shops = @user.sweets_shops
    

  end

  def edit
   @user = current_user
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
     redirect_to user_path(@user.id)
    else
     render :edit
    end
  end

  def withdraw
    @user = current_user
    @user.update(is_active: false)
    reset_session
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :image, :is_active)
  end


end
