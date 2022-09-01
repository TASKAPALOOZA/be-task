class Manager < ApplicationRecord
  validates_presence_of :name, :email, :password_digest
  validates_uniqueness_of :email
  has_secure_password

  has_many :dept_managers
  has_many :departments, through: :dept_managers
end 