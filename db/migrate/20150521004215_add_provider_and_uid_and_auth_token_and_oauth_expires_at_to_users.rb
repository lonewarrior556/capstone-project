class AddProviderAndUidAndAuthTokenAndOauthExpiresAtToUsers < ActiveRecord::Migration
  def change
    add_column :users, :provider, :string
    add_column :users, :uid, :string
    add_column :users, :auth_token, :string
    add_column :users, :oauth_expires_at, :datetime
  end

end
