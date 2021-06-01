class Message < ApplicationRecord
  belongs_to :room
  belongs_to :user
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :heat
  belongs_to :condition

  with_options presence: true do
    validates :heat
    validates :condition
    validates :content
  end

  with_options numericality: { other_than: 1, message: '選択してください' } do
    validates :heat
    validates :condition
  end

end
