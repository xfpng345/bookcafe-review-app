# frozen_string_literal: true

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
      subject do
        post :create,
             params: params
      end
      it 'count up comment' do
        expect { subject }.to change(Comment, :count).by(1)
      end
    end
  end

  describe 'DELETE #destroy' do
    context 'log in' do
      before do
        login user
      end
      it 'deletes the comment' do
        comment = create(:comment, shop_id: shop.id, user_id: user.id)
        expect  do
          delete :destroy, params: { id: comment.id, shop_id: shop.id, user_id: user.id }
        end.to change(Comment, :count).by(-1)
      end
    end
  end
end
