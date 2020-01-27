require 'rails_helper'

describe User do
  describe '#create' do
    
    context 'can save' do
      it "is valid with a nickname, email, password, password_confirmation" do
        user = build(:user)
        expect(user).to be_valid
      end

      it "is valid with a nickname that has less than 10 characters " do
        user = build(:user, username: "1234567890")
        expect(user).to be_valid
      end

      it "is valid with a password that has more than 6 characters " do
        user = build(:user, password: "000000", password_confirmation: "000000")
        user.valid?
        expect(user).to be_valid
      end
    end

    context 'can not save'do
      it "is invalid without a username" do
        user = build(:user, username: "")
        user.valid?
        expect(user.errors[:username]).to include("を入力してください")
      end

      it "is invalid without an email" do
        user = build(:user, email: "")
        user.valid?
        expect(user.errors[:email]).to include("が入力されていません。")
      end

      it "is invalid without a password" do
        user = build(:user, password: nil)
        user.valid?
        expect(user.errors[:password]).to include("が入力されていません。")
      end

      it "is invalid without a password_confirmation although with a password" do
        user = build(:user, password_confirmation: "")
        user.valid?
        expect(user.errors[:password_confirmation]).to include("とパスワードの入力が一致しません")
      end

      it "is invalid with a nickname that has more than 11 characters " do
        user = build(:user, username: "12345678901")
        user.valid?
        expect(user.errors[:username]).to include("は10文字以内で入力してください")
      end
      
      it "is invalid with a duplicate email address" do
        user = create(:user)
        another_user = build(:user, email: user.email)
        another_user.valid?
        expect(another_user.errors[:email]).to include("は既に使用されています。")
      end

      it "is invalid with a password that has less than 5 characters " do
        user = build(:user, password: "00000", password_confirmation: "00000")
        user.valid?
        expect(user.errors[:password]).to include("は6文字以上に設定して下さい。")
      end
    end

  end
end