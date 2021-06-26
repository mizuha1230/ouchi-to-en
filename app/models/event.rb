class Event < ApplicationRecord
  belongs_to :user

  default_scope -> { order(start: :asc) }
 
  validate  :start_end_check
 
  def start_end_check
    if self.start.present? && self.end_time.present?
      errors.add(:end_time, "が開始時刻を上回っています。正しく記入してください。") if self.start > self.end_time 
    end
  end
end

