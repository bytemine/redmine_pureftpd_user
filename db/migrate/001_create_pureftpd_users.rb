class CreatePureftpdUsers < ActiveRecord::Migration
  def self.up
    create_table :pureftpd_users do |t|
      t.column :user, :string
      t.column :password, :string
    end
  end

  def self.down
    drop_table :pureftpd_users
  end
end
