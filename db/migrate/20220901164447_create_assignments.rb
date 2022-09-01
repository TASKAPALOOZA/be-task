class CreateAssignments < ActiveRecord::Migration[5.2]
  def change
    create_table :assignments do |t|
      t.references :task, foreign_key: true
      t.references :employee, foreign_key: true
    end
  end
end
