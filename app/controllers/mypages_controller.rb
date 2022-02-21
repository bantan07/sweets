class MypagesController < ApplicationController

  def index
    @mypage = current_user
    @sweets_shop = current_user
    @sweets_shops = current_user.sweets_shops
  end
  
  def show
    @mypage = current_user
    @like = current_user
    @likes = current_user.likes
  end
end
