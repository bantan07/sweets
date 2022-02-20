class CommentsController < ApplicationController

  def create

    comment = current_user.comments.new(comment_params)

    comment.sweets_shop_id = params[:sweets_shop_id]
    sweets_shop = SweetsShop.find(params[:sweets_shop_id])
    comment.save
    redirect_to sweets_shop_path(sweets_shop)
  end

  def destroy
     Comment.find_by(id: params[:id]).destroy
    redirect_to sweets_shop_path(params[:sweets_shop_id])
  end


  private

  def comment_params
    params.require(:comment).permit(:comment)
  end
end

