class ShopsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :validate_shop,only: [:edit, :update, :destroy]

  def index
    @search = Shop.ransack(params[:q])
    @shops = @search.result.page(params[:page]).per(9).order("updated_at DESC")
    @random = Shop.order("RAND()").limit(5)
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

  def update
    @shop = Shop.find(params[:id])
    if @shop.update_attributes(shop_params)
      redirect_to @shop, notice: '投稿が編集されました。'
    else
      flash.now[:alert] = '編集に失敗しました。'
      render :edit
    end
  end

  def new
    @shop = current_user.shops.new
   end

  def create
    @shop = current_user.shops.new(shop_params)
    if @shop.save
      redirect_to shops_path, notice: '投稿に成功しました。'
    else
      flash.now[:alert] = '店名を入力してください。'
      render :new
    end
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
      redirect_to shops_path
    end
  end
end
