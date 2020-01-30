# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @shop = Shop.find(params[:shop_id])
    @comment = @shop.comments.new(comment_params)
    @comment.user_id = current_user.id
    render :comment if @comment.save
  end

  def destroy
    @comment = Comment.find(params[:id])
    if @comment.user_id == current_user.id
      render :comment if @comment.destroy
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id)
  end
end
