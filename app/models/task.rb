class Task < ApplicationRecord
  belongs_to :department
  has_many :assignments
  has_many :employees, through: :assignments

  validates_presence_of :scope, :title, :description, :status 
  enum scope: ['ASAP', 'Daily', 'Weekly']
  enum status: ['Created', 'Assigned', 'In Progress', 'Completed']
end
