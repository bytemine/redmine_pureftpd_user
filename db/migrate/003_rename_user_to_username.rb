class RenameUserToUsername < ActiveRecord::Migration
  def self.up
    rename_column :pureftpd_users, :user, :username
  end

  def self.down
    rename_column :pureftpd_users, :username, :user
  end
end
