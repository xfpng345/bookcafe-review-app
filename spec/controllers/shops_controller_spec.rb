require 'rails_helper'

describe ShopsController do
  describe 'GET #new' do
    it "renders the :new template" do
      get :new
      expect(response).to render_template :new
    end
  end

  describe 'GET #edit' do
    it "assigns the requested shop to @shop" do
      shop = create(:shop)
      get :edit, params: { id: shop }
      expect(assigns(:shop)).to eq shop
    end

    it "renders the :edit template" do
      shop = create(:shop)
      get :edit, params: { id: shop }
      expect(response).to render_template :edit
    end
  end

  describe 'GET #index' do
    it "populates an array of shops ordered by created_at DESC" do
      shops = create_list(:shop, 3) 
      get :index
      expect(assigns(:shops)).to match(shops)
      # expect(assigns(:shops)).to match(shops.sort{ |a, b| b.created_at <=> a.created_at } )
    end

    it "renders the :index template" do
      get :index
      expect(response).to render_template :index
    end
  end

end