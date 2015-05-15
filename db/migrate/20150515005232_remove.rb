class Remove < ActiveRecord::Migration
  def change
    remove_index(:responses, [:question_id, :user_id])
  end
end
