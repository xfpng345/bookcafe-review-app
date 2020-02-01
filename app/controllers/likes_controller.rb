# frozen_string_literal: true

class LikesController < ApplicationController
  before_action :set_shop

  def create
    @like = Like.create(user_id: current_user.id, shop_id: params[:shop_id])
    @likes = Like.where(shop_id: params[:shop_id])
    @shop.reload
  end

  def destroy
    like = Like.find_by(user_id: current_user.id, shop_id: params[:shop_id])
    like.destroy
    @likes = Like.where(shop_id: params[:shop_id])
    @shop.reload
  end

  private

  def set_shop
    @shop = Shop.find(params[:shop_id])
  end
end
