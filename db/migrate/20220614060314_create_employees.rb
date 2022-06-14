class CreateEmployees < ActiveRecord::Migration[7.0]
  def change
    create_table :employees do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.string :gender
      t.date :birth_date
      t.belongs_to :user, foreign_key:true, null:false 

      t.timestamps
    end
  end
end
