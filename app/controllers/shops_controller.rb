class ShopsController < ApplicationController
  def index
    @shops = Shop.order("created_at DESC").page(params[:page]).per(5).search(params[:search])
  end

  def show
    @shop = Shop.find(params[:id])
  end

  def search
  end

  def edit
    @shop = Shop.find(params[:id])
  end

  def new
    @shop = Shop.new
   end

   def create
    @shop = Shop.create(shop_params)
    redirect_to root_path
  end
  
  
def destroy
  @shop = Shop.find(params[:id])
  @shop.destroy
  # if article.user_id == current_user.id
  #   article.destroy
  # end
end

  private
  def shop_params
    params.require(:shop).permit(:name, :text, :image)
  end
  
end
