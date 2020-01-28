require 'rails_helper'

feature 'sign_in', type: :feature do
  let(:user) { create(:user) }
  
  scenario 'sign in' do
    visit new_user_session_path
    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: user.password
    click_on 'ログインする'
    expect(current_path).to eq root_path
  end
end
