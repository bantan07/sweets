class HomesController < ApplicationController

  def top
    @sweets_shop = SweetsShop.new
    @sweets_shops = SweetsShop.all
  end    
end
