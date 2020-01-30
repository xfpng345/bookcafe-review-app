require 'rails_helper'

describe CommentsController do
  let(:user) { create(:user) }
  let(:shop) { create(:shop) }
  let(:params) { { shop_id: shop.id, user_id: user.id, comment: attributes_for(:comment) } }

  describe 'POST #create' do
    context 'log in' do
      before do
        login user
      end
      subject {
         post :create,
         params: params
       }
      it 'count up comment' do
        expect{ subject }.to change(Comment, :count).by(1)
      end
    end
  end

  describe 'DELETE #destroy' do
    context 'log in' do
      before do
        login user
      end
      it "deletes the comment" do
        comment = create(:comment, shop_id: shop.id, user_id: user.id)
        expect{
          delete :destroy, params: { id: comment.id, shop_id: shop.id, user_id: user.id }
        }.to change(Comment,:count).by(-1)
      end
    end
  end
end