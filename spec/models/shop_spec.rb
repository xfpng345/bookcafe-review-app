require 'rails_helper'

RSpec.describe Shop, type: :model do
  describe '#create' do
    context 'can save'do
      it 'is valid with content' do
        expect(build(:shop, image: nil)).to be_valid
      end
      
    end
  end
end