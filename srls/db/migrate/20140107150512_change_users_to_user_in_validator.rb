class ChangeUsersToUserInValidator < ActiveRecord::Migration
  def change
    rename_column :validators, :users_id, :user_id
  end
end
