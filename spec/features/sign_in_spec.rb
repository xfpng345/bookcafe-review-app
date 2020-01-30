require 'rails_helper'

feature 'sign_in', type: :feature do
  let(:user) { create(:user) }

  #テストの際はviewで簡単ログインボタンの_testuserファイルをコメントアウトする。
  scenario 'sign in' do
    visit new_user_session_path
    
    click_on 'ログインする'
    expect(page).to have_content 'メールアドレスまたはパスワードが違います。'

    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: user.password
    click_on 'ログインする'
    expect(current_path).to eq root_path
    expect(page).to have_content user.username
  end
end
