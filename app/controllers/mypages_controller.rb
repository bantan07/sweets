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

# def withdraw
#   @customer = current_customer
#   @customer.update(is_active: false)
#   reset_session
#   redirect_to root_path
# end

　private

　def mypage_params
    params.require(:mypage).permit(:user_id, :image, :sweets_shop_id)
  end

end
