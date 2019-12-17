class ShopsController < ApplicationController
  def index
    @shops = Shop.order("created_at DESC").page(params[:page]).per(6).search(params[:search])
  end

  def show
    @shop = Shop.find(params[:id])
    @hash = Gmaps4rails.build_markers(@shop) do |shop, marker|
      marker.lat shop.latitude
      marker.lng shop.longitude
      marker.infowindow render_to_string(partial: "shops/infowindow", locals: { shop: shop })
    end
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

  def update
    @shop = Shop.find(params[:id])
    @shop.update(shop_params)
    redirect_to shop_path
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
    params.require(:shop).permit(:name, :text, :image, :address, :latitude , :longitude ,)
  end
  
end
