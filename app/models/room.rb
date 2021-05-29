class Room < ApplicationRecord
  has_many :room_users
  has_many :users, through: :room_users, validate: false

  validates :room_name, presence: true
end
