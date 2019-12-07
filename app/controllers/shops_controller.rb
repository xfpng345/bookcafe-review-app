class ShopsController < ApplicationController
  def index
    @shops = Shop.all
  end

  def show
  end

  def search
  end

  def edit
  end

  def new
    @shop = Shop.new
   end

   def create
    @shop = Shop.create(shop_params)
    redirect_to root_path
  end

  private
  def shop_params
    params.require(:shop).permit(:name, :text, :image)
  end
  
end
