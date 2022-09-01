class Employee < ApplicationRecord
  belongs_to :department
  has_many :assignments
  has_many :tasks, through: :assignments

  has_secure_password
  validates_presence_of :email
  validates_uniqueness_of :email
end
