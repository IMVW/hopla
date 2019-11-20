class Department < ApplicationRecord
  has_and_belongs_to_many :users
  has_many :shifts
  validates :name, uniqueness: true
  validates :name, presence: true
end
