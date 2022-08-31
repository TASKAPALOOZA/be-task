class Department < ApplicationRecord
  validates_presence_of :title

  has_many :dept_managers
  has_many :managers, through: :dept_managers
end 