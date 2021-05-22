require 'rails_helper'

RSpec.describe Activity, type: :model do
  before do
    @activity = FactoryBot.build(:activity)
  end

  describe '活動内容の保存' do
    context '活動内容が投稿できる時' do
      it '画像・今日の様子・連絡事項があれば投稿できる' do
        expect(@activity).to be_valid
      end
      it '今日の様子が記入されていれば投稿できる' do
        @activity.image = ''
        @activity.contact = ''
        expect(@activity).to be_valid
      end
    end
    context '活動内容が投稿できない時' do
      it '今日の様子が記入されていなければ投稿できない' do
        @activity.activity_content = ''
        @activity.valid?
        expect(@activity.errors.full_messages).to include("今日の様子を入力してください")
      end
      it 'ユーザーが紐付いていなければ投稿できない' do
        @activity.user = nil 
        @activity.valid?
        expect(@activity.errors.full_messages).to include("Userを入力してください")
      end
    end
  end
end
