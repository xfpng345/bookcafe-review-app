require 'rails_helper'

feature 'shop', type: :feature do
  let(:user) { create(:user) }
  let(:shop) { create(:shop) }

  scenario 'post shop' do

    visit new_user_session_path
    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: user.password
    click_on 'ログインする'

    visit new_shop_path
    fill_in 'shop_name', with: shop.name
    fill_in 'shop_text', with: shop.text
    expect {
    click_on '投稿'
    }.to change(Shop, :count).by(1)
    expect(current_path).to eq shops_path
    
  end
end