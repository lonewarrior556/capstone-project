class AddIndexOnUsers < ActiveRecord::Migration
  def change
    add_index(:users, :auth_token)
    add_index(:users, :provider)
    add_index(:users, :uid)
  end
end
