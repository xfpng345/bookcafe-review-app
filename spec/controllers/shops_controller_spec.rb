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

end