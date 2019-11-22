class Department < ApplicationRecord
  # has_and_belongs_to_many :users
  has_many :shifts
  validates :name, uniqueness: true
  validates :name, presence: true
  has_many :department_users
  has_many :users, through: :departments_users
  has_many :colors
end
