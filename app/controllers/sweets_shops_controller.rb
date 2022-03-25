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
    @user = @sweets_shop.user
    @comment = Comment.new
    @comments = Comment.all
  end


  def create
    @sweets_shop = SweetsShop.new(sweets_shop_params)
    @sweets_shop.user_id = current_user.id
    tag_list = params[:sweets_shop][:tag_ids].split(',')
    if @sweets_shop.save
       @sweets_shop.save_tags(tag_list)
      redirect_to sweets_shop_path(@sweets_shop.id)
    else
       @sweets_shops = SweetsShop.all
      render :new
    end
  end

  def search

    @sweets_shops = SweetsShop.search(params[:search])

    @selection = params[:keyword]
    if params[:keyword].present?
     @sweets_shops = SweetsShop.sort(@selection)
    end
    render :index

  end

  def destroy
    @sweets_shop = SweetsShop.find(params[:id]).destroy
    redirect_to sweets_shops_path
  end


  private

  def sweets_shop_params
    params.require(:sweets_shop).permit(:user_id, :image, :shop_name, :item_name, :genre, :price, :address, :body,
    :start_time, :finish_time, :regular_holiday, :tag, :status, :prefectures, :search)
  end


end

