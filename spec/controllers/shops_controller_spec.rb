require 'rails_helper'

describe ShopsController do
  let(:user) { create(:user) }

  context 'log in' do
    before do
      login user
    end

    describe 'GET #show' do
      it "assigns @comment" do
        shop = create(:shop)
        get :show, params: { id: shop }
        expect(assigns(:comment)).to be_a_new(Comment)
      end
    end

    describe 'GET #new' do
      it "renders the :new template" do
        get :new
        expect(response).to render_template :new
      end
    end

    describe '#create' do
      let(:params) { { user_id: user.id, shop: attributes_for(:shop) } }

      context 'can save' do
        subject {
           post :create,
           params: params
         }
      
        it 'count up shop' do
           expect{ subject }.to change(Shop, :count).by(1)
        end

        it 'redirects to shops_path' do
          subject
          expect(response).to redirect_to(shops_path)
        end

        context 'can not save' do
          let(:invalid_params) { {user_id: user.id, shop: attributes_for(:shop, name: nil, text:nil) } }
        
           subject {
             post :create,
             params: invalid_params
           }
        
          it 'does not count up' do
             expect{ subject }.not_to change(Shop, :count)
          end
        end

        it 'renders new' do
          subject
          get :new
          expect(response).to render_template :new
        end
        
      end
    end

    context ' shop.user_id == current_user.id' do

      describe 'GET #edit' do
        it "assigns the requested shop to @shop" do
          shop = create(:shop, user_id: user.id)
          get :edit, params: { id: shop }
          expect(assigns(:shop)).to eq shop
        end

        it "renders the :edit template" do
          shop = create(:shop, user_id: user.id)
          get :edit, params: { id: shop }
          expect(response).to render_template :edit
        end
      end

      describe 'PATCH #update' do

        context 'can update' do
          it "locates the requersted @shop" do
            shop = create(:shop)
            patch :update, params: { id: shop, shop: attributes_for(:shop) }
            expect(assigns(:shop)).to eq shop
          end
        end
        
        context 'can not update' do
          
        end
      end

    end

  end

  context 'not log in' do

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

    describe 'GET #show' do
      it "assigns the requested shop to @shop" do
        shop = create(:shop)
        get :show, params: { id: shop }
        expect(assigns(:shop)).to eq shop
      end

      it "renders the :show template" do
        shop = create(:shop)
        get :show, params: { id: shop }
        expect(response).to render_template :show
      end
    end

    describe '#create' do
      it 'redirects to new_user_session_path' do
        post :create
        expect(response).to redirect_to(new_user_session_path)
      end
    end

  end

end