class CreateEmployees < ActiveRecord::Migration[5.2]
  def change
    create_table :employees do |t|
      t.references :department, foreign_key: true
      t.string :email
      t.string :password_digest
      t.timestamps
    end
  end
end
