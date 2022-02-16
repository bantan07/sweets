class LikesController < ApplicationController

  def like
    # @sweets_shops = SweetsShop.all
    Like.create!(user_id: current_user.id, sweets_shop_id: params[:sweets_shop_id])
    @sweets_shop = SweetsShop.find(params[:sweets_shop_id])
    # redirect_to sweets_shop_path(params[:sweets_shop_id])
  end

  def unlike
    like = Like.find_by(user_id: current_user.id, sweets_shop_id: params[:sweets_shop_id])
    like.destroy
    @sweets_shop = SweetsShop.find(params[:sweets_shop_id])
    # redirect_to sweets_shop_path(params[:sweets_shop_id])
  end
end
