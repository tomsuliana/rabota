class CreateAnswers < ActiveRecord::Migration[7.0]
  def change
    create_table :answers do |t|
      t.integer :examine_id
      t.integer :quest_id
      t.integer :user_answer

      t.timestamps
    end
    add_foreign_key :answers, :examines
  end
end
