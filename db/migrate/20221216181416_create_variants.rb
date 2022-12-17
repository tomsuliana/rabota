class CreateVariants < ActiveRecord::Migration[7.0]
  def change
    create_table :variants do |t|
      t.string :var_text
      t.boolean :correct
      t.integer :question_id

      t.timestamps
    end
    add_foreign_key :variants, :questions
  end
end
