class Message < ApplicationRecord
  belongs_to :room
  belongs_to :user
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :heat
  belongs_to_active_hash :condition
end
