# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :set_user

  def show
    @shops = @user.shops.includes(:user, :likes).page(params[:page]).per(6).order('created_at DESC')
    @liked_shops = @user.like_shops.page(params[:page]).per(6).order('created_at DESC')
  end

  def following
    @users = @user.following
  end

  def followers
    @users = @user.followers
  end

  def set_user
    @user  = User.find(params[:id])
  end
end
