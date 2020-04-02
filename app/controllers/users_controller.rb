# frozen_string_literal: true

class UsersController < ApplicationController
  def show
    @user = User.find_by(id: params[:id])
    @shops = @user.shops.page(params[:page]).per(6).order('created_at DESC')
    @liked_shops = @user.like_shops.page(params[:page]).per(6).order('created_at DESC')
  end

  def following
    @user  = User.find(params[:id])
    @users = @user.following
    render 'show_follow'
  end

  def followers
    @user  = User.find(params[:id])
    @users = @user.followers
    render 'show_follower'
  end
end
