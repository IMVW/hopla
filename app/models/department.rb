class Department < ApplicationRecord
  # has_and_belongs_to_many :users
  has_many :shifts
  has_many :department_users
  has_many :users, through: :departments_users

  validates :name, uniqueness: true
  validates :name, presence: true
end
