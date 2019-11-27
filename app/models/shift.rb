class Shift < ApplicationRecord
  belongs_to :department
  belongs_to :user, optional: true

  validates :start_time, presence: true
  validates :end_time, presence: true
  validate :time_in_order

  def time_in_order
    if start_time.nil? || end_time.nil?
      errors.add(:start_time, "must have start and end time")
    else
      errors.add(:start_time, "must be before end time") unless start_time < end_time
    end
  end
end
