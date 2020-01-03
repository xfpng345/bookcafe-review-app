class CommentsController < ApplicationController
  def create
    @shop = Shop.find(params[:shop_id])
    @comment = @shop.comments.build(comment_params)
    @comment.user_id = current_user.id
    render :comment if @comment.save
  end

  def destroy
    @comment = Comment.find_by(id: params[:id],shop_id: params[:shop_id])
    if @comment.user_id == current_user.id
      render :comment if @comment.destroy
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id)
  end
end
