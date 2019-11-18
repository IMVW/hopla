class Department < ApplicationRecord
  validates :name, uniqueness: true

  has_many :users, through: :user_departments
end
