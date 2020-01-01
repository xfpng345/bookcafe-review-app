class CommentsController < ApplicationController
  def create
    @shop = Shop.find(params[:shop_id])
    @comment = @shop.comments.create(comment_params)
    respond_to do |format|
      format.html { redirect_to shop_path(@shop) } 
      format.json
    end
  end

  def destroy
    @comment = Comment.find_by(id: params[:id],shop_id: params[:shop_id])
    @comment.destroy if @comment.user_id == current_user.id
    redirect_to :back
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id)
  end
end
