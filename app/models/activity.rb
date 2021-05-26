class Activity < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  validates :activity_content, presence: true
end
