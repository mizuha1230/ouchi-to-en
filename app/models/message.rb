class Message < ApplicationRecord
  belongs_to :room
  belongs_to :user
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :heat
  belongs_to :condition

  with_options presence: true do
    validates :heat_id
    validates :condition_id
    validates :content
  end

  with_options numericality: { other_than: 1, message: 'Select' } do
    validates :heat_id
    validates :condition_id
  end
end
