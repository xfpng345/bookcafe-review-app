class ShopsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :validate_shop,only: [:edit, :update, :destroy]

  def index
    @search = Shop.ransack(params[:q])
    @shops = @search.result.page(params[:page]).per(6).order("updated_at DESC")
  end

  def show
    @shop = Shop.find(params[:id])
    @comment = Comment.new
    @comments = @shop.comments.includes(:user)  
    @hash = Gmaps4rails.build_markers(@shop) do |shop, marker|
      marker.lat shop.latitude
      marker.lng shop.longitude
      marker.infowindow render_to_string(partial: "shops/infowindow", locals: { shop: shop })
    end
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
end

  private
  def shop_params
    params.require(:shop).permit(:name, :text, :image, :address, :latitude , :longitude ,:area).merge(user_id: current_user.id)
  end
  
  def validate_shop
    @shop = Shop.find_by(id:params[:id])
    if @shop.user_id != current_user.id
      redirect_to root_path
    end
  end
end
