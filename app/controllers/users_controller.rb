class UsersController < ApplicationController
  def show
    @user = User.find_by(id: params[:id])
    @shops = @user.shops.page(params[:page]).per(6).order("created_at DESC")
    @liked_shops = @user.like_shops.page(params[:page]).per(6).order("created_at DESC")
  end
end
