# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @shop = Shop.find(params[:shop_id])
    @comment = @shop.comments.new(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      @shop.create_notification_comment!(current_user, @comment.id)
      render :comment 
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    return unless @comment.user_id == current_user.id

    render :comment if @comment.destroy
  end

  private

  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id)
  end
end
