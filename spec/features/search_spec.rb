# frozen_string_literal: true

require 'rails_helper'

feature 'search', type: :feature do
  let(:user) { create(:user) }
  let(:shop) { create(:shop) }

  scenario 'search shop with shop.name' do
    shop1 = create(:shop, name: 'aaa')# rubocop:disable all
    shop2 = create(:shop, name: 'bbb')# rubocop:disable all
    shop3 = create(:shop, name: 'ccc')# rubocop:disable all

    visit new_user_session_path
    # fill_in 'user_email', with: user.email
    # fill_in 'user_password', with: user.password
    # click_on 'ログインする'

    # visit shops_path
    # expect(page).to have_content 'カフェ一覧'
    # fill_in 'q_name_or_user_username_cont', with: 'aaa'
    # # find('input[name="commit"]').click
    # # expect(page).to have_no_content 'bbb'
  end
end
