class SweetsShopsController < ApplicationController
  before_action :authenticate_user!

  def new
    @sweets_shop = SweetsShop.new
  end

  def index
    @sweets_shop = SweetsShop.new
    @sweets_shops = SweetsShop.all
  end

  def show
    @sweets_shop = SweetsShop.find(params[:id])
  end


  def create
    
    @sweets_shop = SweetsShop.new(sweets_shop_params)
    if @sweets_shop.save!
      redirect_to sweets_shop_path(@sweets_shop.id)
    else
       @sweets_shops = SweetsShop.all
      render :index
    end
  end

  private

  def sweets_shop_params
    params.require(:sweets_shop).permit(:user_id, :image_id, :shop_name, :item_name, :genre, :price, :address, :body,
    :business_hours, :regular_holiday, :tag, :status)
  end
end

