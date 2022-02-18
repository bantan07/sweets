class MypagesController < ApplicationController

  def index
    @mypage = current_user
    @sweets_shop = current_user
    @sweets_shops = current_user.sweets_shops
  end
end
