class Event < ApplicationRecord
  belongs_to :user

  default_scope -> { order(start: :asc) }

  validate :start_end_check

  def start_end_check
    errors.add(:end_time, 'が開始時刻を上回っています。正しく記入してください。') if start.present? && end_time.present? && (start > end_time)
  end
end
