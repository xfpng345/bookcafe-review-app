# frozen_string_literal: true

class UsersController < ApplicationController
  def show
    @user = User.find_by(id: params[:id])
    @shops = @user.shops.includes(:user, :likes).page(params[:page]).per(6).order('created_at DESC')
    @liked_shops = @user.like_shops.includes(:user, :likes).page(params[:page]).per(6).order('created_at DESC')
  end

  def following
    @user  = User.find(params[:id])
    @users = @user.following
  end

  def followers
    @user  = User.find(params[:id])
    @users = @user.followers
  end
end
