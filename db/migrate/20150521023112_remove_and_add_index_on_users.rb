class RemoveAndAddIndexOnUsers < ActiveRecord::Migration
  def change
    remove_index(:users, :email)
    remove_index(:users, :username)
    add_index(:users, [:email, :provider], unique: true)
    add_index(:users, [:username, :provider], unique: true)
    add_index(:users, :username)
    add_index(:users, :email)
    change_column_default(:users, :provider, "capstone_project" )
  end

end
