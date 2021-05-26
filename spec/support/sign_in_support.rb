module SignInSupport
  def sign_in(user)
    visit new_user_session_path
    fill_in 'メールアドレス', with: user.email
    fill_in 'パスワード（英数字混合６文字以上）', with: user.password
    find('input.sign-btn').click
    expect(current_path).to eq(root_path)
  end
end
