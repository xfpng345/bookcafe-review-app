class UsersController < ApplicationController
  def show
    @user = current_user
    @shops = current_user.shops.page(params[:page]).per(5).order("created_at DESC")
  end
end
