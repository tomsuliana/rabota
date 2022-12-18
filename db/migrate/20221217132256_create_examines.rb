class CreateExamines < ActiveRecord::Migration[7.0]
  def change
    create_table :examines do |t|
      t.integer :score
      t.integer :user_id

      t.timestamps
    end
    add_foreign_key :examines, :users
  end
end
