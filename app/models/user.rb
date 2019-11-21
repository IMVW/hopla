class User < ApplicationRecord
  attr_accessor :department_id
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # has_and_belongs_to_many :departments
  has_many :departments_users
  has_many :departments, through: :departments_users
  has_many :shifts

  validates :email, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates_uniqueness_of :first_name, scope: :last_name

  mount_uploader :photo, PhotoUploader
end
