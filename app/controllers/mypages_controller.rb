class MypagesController < ApplicationController

  before_action :authenticate_user!

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

end
