# frozen_string_literal: true

require 'rails_helper'

describe UsersController do
  describe 'GET #show' do
    let(:user) { create(:user) }
    it 'assigns @user' do
      user = create(:user)
      get :show, params: { id: user }
      expect(assigns(:user)).to eq user
    end

    it 'renders the :show template' do
      user = create(:user)
      get :show, params: { id: user }
      expect(response).to render_template :show
    end

    it 'populates an array of shops ordered by created_at DESC' do
      shops = create_list(:shop, 3, user_id: user.id)
      get :show, params: { id: user.id }
      expect(assigns(:shops)).to match(shops.sort { |a, b| b.created_at <=> a.created_at })
    end
  end
end
