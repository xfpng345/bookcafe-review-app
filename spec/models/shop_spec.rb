require 'rails_helper'

RSpec.describe Shop, type: :model do
  describe '#create' do

    context 'can save'do
      it 'is valid with name and text' do
        expect(build(:shop, image: nil, address: nil, area: nil)).to be_valid
      end
    end

    context 'can not save' do
      it 'is invalid without name' do
        shop = build(:shop, name: nil)
        shop.valid?
        expect(shop.errors[:name]).to include("を入力してください")
      end
      
      it 'is invalid without text' do
        shop = build(:shop, text: nil)
        shop.valid?
        expect(shop.errors[:text]).to include("を入力してください")
      end

      it 'is invaid without user_id' do
        shop = build(:shop, user_id: nil)
        shop.valid?
        expect(shop.errors[:user]).to include("を入力してください")
      end
    end

  end
end