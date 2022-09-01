class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.references :department, foreign_key: true
      t.integer :scope
      t.string :title
      t.string :description
      t.integer :status
      t.timestamps
    end
  end
end
