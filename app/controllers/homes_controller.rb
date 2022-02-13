class HomesController < ApplicationController
  
  def top
    @sweets_shop = SweetsShop.new
    @sweets_shops = SweetsShop.all
  end
  
  def show
    @sweets_shop = SweetsShop.find(params[:id])
  end
end
