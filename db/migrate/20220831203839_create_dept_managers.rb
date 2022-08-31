class CreateDeptManagers < ActiveRecord::Migration[5.2]
  def change
    create_table :dept_managers do |t|
      t.references :manager, foreign_key: true
      t.references :department, foreign_key: true

      t.timestamps
    end
  end
end
