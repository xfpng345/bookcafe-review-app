# frozen_string_literal: true

require 'rails_helper'

feature 'like', type: :feature do
  let(:user) { create(:user) }
  let(:shop) { create(:shop, id: 1, user_id: user.id) }

  scenario 'like' do
    visit new_user_session_path
    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: user.password
    click_on 'ログインする'

    visit new_shop_path
    fill_in 'shop_name', with: shop.name
    fill_in 'shop_text', with: shop.text
    expect do
      click_on '投稿'
    end.to change(Shop, :count).by(1)
    expect(current_path).to eq shops_path

    visit shops_path
    expect(page).to have_content shop.name
    # expect {
    # find("#likes_buttons_#{shop.id}").click
    # }.to change(Like, :count).by(1)
  end
end
