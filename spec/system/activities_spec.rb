require 'rails_helper'

RSpec.describe '活動内容', type: :system do
  before do
    @user = FactoryBot.create(:user)
  end
  context '活動内容投稿ができるとき' do
    it '活動内容の投稿に成功すると、トップページに遷移して、投稿した内容が表示されている' do
      # サインインする
      sign_in(@user)
      # 新規投稿ページへ遷移する
      visit new_activity_path
      # 値をテキストフォームに入力する
      post = 'テスト'
      fill_in 'activity[activity_content]', with: post
      # 送信した値がDBに保存されていることを確認する
      expect do
        find('input[name="commit"]').click
      end.to change { Activity.count }.by(1)
      # 投稿一覧画面に遷移していることを確認する
      expect(current_path).to eq(root_path)
      # 送信した値がブラウザに表示されていることを確認する
      expect(page).to have_content(post)
    end

    it 'テキストと画像の投稿に成功すること' do
      # サインインする
      sign_in(@user)
      # 新規投稿ページへ遷移する
      visit new_activity_path
      # 添付する画像を定義する
      image_path = Rails.root.join('public/images/test_image.png')
      # 画像選択フォームに画像を添付する
      attach_file('activity[image]', image_path, make_visible: true)
      # 値をテキストフォームに入力する
      post = 'テスト'
      fill_in 'activity[activity_content]', with: post
      fill_in 'activity[contact]', with: post
      # 送信した値がDBに保存されていることを確認する
      expect  do
        find('input[name="commit"]').click
      end.to change { Activity.count }.by(1)
      # 送信した値がブラウザに表示されていることを確認する
      expect(page).to have_content(post)
    end
  end
  context '活動内容投稿ができないとき' do
    it 'ログインしていないと新規投稿ページに遷移できない' do
      # トップページに遷移する
      visit root_path
      # 新規投稿ページへのリンクがない
      expect(page).to have_no_content('投稿する')
    end
    it 'user_idが1以外の場合は新規投稿ページに遷移できない' do
      # ログインページへ移動する
      visit new_user_session_path
      # サインインする
      user_name = '山田二郎'
      user_email = 'test2@test.com'
      user_password = 'test12'
      fill_in 'メールアドレス', with: user_email
      fill_in 'パスワード', with: user_password
      # ログインボタンをクリックする
      find('input[name="commit"]').click
      # 新規投稿ページへのリンクがない
      expect(page).to have_no_content('投稿する')
    end
  end
end

RSpec.describe '活動内容詳細', type: :system do
  before do
    @activity = FactoryBot.create(:activity)
    image_path = Rails.root.join('public/images/test_image.png')
  end
  it 'ログインしたユーザーは活動内容詳細ページに遷移し、活動内容の詳細が表示される' do
    # ログインする
    sign_in(@activity.user)
    # 活動内容に「詳細」ボタンがあることを確認する
    expect(page).to have_link '詳細', href: activity_path(@activity)
    # 詳細ページに遷移する
    visit activity_path(@activity)
    # 詳細ページに活動内容が表示されている
    expect(page).to have_selector('img')
    expect(page).to have_content(@activity.activity_content)
    expect(page).to have_content(@activity.contact)
  end
  it 'ログインしていない状態で活動内容詳細ページに遷移できない' do
    # トップページに移動する
    visit root_path
    # ツイートに「詳細」ボタンがないことを確認する
    expect(page).to have_no_link '詳細', href: activity_path(@activity)
  end
end
