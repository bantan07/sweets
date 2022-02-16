class MypagesController < ApplicationController
before_action :authenticate_user!
before_action :ensure_correct_user

  def index
    @mypage = current_user
    @sweets_shops = current_user.sweets_shops
  end

  # def show
  #   @mypage = cureent_user
  # end



  private

  def mypage_params
    params.require(:mypage).permit(:user_id, :image, :sweets_shop_id)
  end

  def ensure_correct_user
    user = Mypage.find(params[:id]).user
    if current_user.id != user.id
      redirect_to sweets_shops_path
    end
  end
end