class FixAdminFlagOnUsers < ActiveRecord::Migration
  def change
    remove_column :users, :admin_flag
    remove_column :users, :boolean
    add_column :users, :admin_flag, :boolean
  end
end
