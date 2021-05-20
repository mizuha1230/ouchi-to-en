require 'rails_helper'

RSpec.describe "ユーザー新規登録", type: :system do
  before do
    @user = FactoryBot.build(:user)
  end
  context "ユーザー新規登録ができるとき" do
    it "正しい情報を入力すればユーザー新規登録ができて、トップページに遷移する" do
      # トップページに遷移する
      visit root_path
      # トップページに新規登録ボタンが表示されていることを確認する
      expect(page).to have_content('新規登録')
      # 新規登録ページへ移動する
      visit new_user_registration_path
      # ユーザー情報を入力する
      fill_in '名前（例：山田 太郎）', with: @user.name
      fill_in 'メールアドレス', with: @user.email 
      fill_in 'パスワード', with: @user.password
      fill_in 'パスワード（確認用）', with: @user.password_confirmation
      # 新規登録ボタンを押すと、ユーザーモデルのカウントが１上がることを確認する
      expect{
        find('input[name="commit"]').click
      }.to change { User.count }.by(1)
      # トップページへ遷移する
      expect(current_path).to eq(root_path)
      # トップページにログアウトボタンが表示されていることを確認する
      expect(page).to have_content('ログアウト')
      # 新規登録ボタンや、ログインボタンが表示されていないことを確認する
      expect(page).to have_no_content('新規登録')
      expect(page).to have_no_content('ログイン')
    end
  end
  context "ユーザー新規登録ができないとき" do
    it "誤った情報ではユーザー新規登録ができずに、再び新規登録ページに戻ってくる" do
      # トップページに遷移する
      visit root_path
      # トップページに新規登録ボタンが表示されていることを確認する
      expect(page).to have_content('新規登録')
      # 新規登録ページへ移動する
      visit new_user_registration_path
      # ユーザー情報を入力する
      fill_in '名前（例：山田 太郎）', with: ''
      fill_in 'メールアドレス', with: ''
      fill_in 'パスワード', with: ''
      fill_in 'パスワード（確認用）', with: ''
      # 新規登録ボタンを押しても、ユーザーモデルのカウントが上がらないことを確認する
      expect{
        find('input[name="commit"]').click
      }.to change { User.count }.by(0)
      # 新規登録ページへ戻されることを確認する
      expect(current_path).to eq user_registration_path
    end
  end
end

RSpec.describe "ログイン", type: :system do
  before do
    @user = FactoryBot.create(:user)
  end
  context "ログインができるとき" do
    it "保存されているユーザーの情報と合致すればログインができ、トップページに遷移する" do
      # ログインページへ移動する
      visit new_user_session_path
      # 正しいユーザー情報を入力する
      fill_in 'メールアドレス', with: @user.email 
      fill_in 'パスワード（英数字混合６文字以上）', with: @user.password
      # ログインボタンをクリックする
      find('input[name="commit"]').click
      # トップページへ遷移していることを確認する
      expect(current_path).to eq(root_path)
      # トップページにログアウトボタンが表示されていることを確認する
      expect(page).to have_content('ログアウト')
      # 新規登録ボタンや、ログインボタンが表示されていないことを確認する
      expect(page).to have_no_content('新規登録')
      expect(page).to have_no_content('ログイン')
    end
  end
  context "ログインができないとき" do
    it "保存されているユーザーの情報と合致しないとログインができず、再び新規登録ページに戻ってくる" do
      # ログインページへ移動する
      visit new_user_session_path
      # ユーザー情報を入力する
      fill_in 'メールアドレス', with: ''
      fill_in 'パスワード', with: ''
      # ログインボタンをクリックする
      find('input[name="commit"]').click
      # ログインページへ戻されることを確認する
      expect(current_path).to eq (new_user_session_path)
    end
  end
end
