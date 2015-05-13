class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.integer :user_id, null: false
      t.integer :best_answer_id
      t.string :title, null: false
      t.text :body, null: false
      t.timestamps null: false
    end
    add_index(:questions, :user_id)
    add_index(:questions, :title)
  end
end
