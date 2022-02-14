class UsersController < ApplicationController

  def show
    @users = User.find(params[:id])
  end

  def edit
   @user = User.find(params[:id])
   if @user.id == current_user.id
   else
    redirect_to mypages_path(current_user)
   end
  end

  def update
   @user = urrent_user
   if @user.update(user_params)
    redirect_to mypages_path(current_user)
   else
     render :edit
   end
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :image)
  end
end
