class Shift < ApplicationRecord
  validates :start_time, presence: true
  validates :end_time, presence: true
  validate :time_in_order

  def time_in_order
    errors.add(:start_time, "must be before end time") unless start_time < end_time
  end

  belongs_to :department
  belongs_to :user
end
