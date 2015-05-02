class AddIndexToUsersAuthToken < ActiveRecord::Migration
  def change
    add_index :users, :auth_token
  end
end
