class DeptManager < ApplicationRecord
  belongs_to :department
  belongs_to :manager
end 