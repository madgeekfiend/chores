class RenameTypetoRole < ActiveRecord::Migration
  def change
    rename_column :passwords, :type, :role
    rename_column :notifications, :type, :role
  end
end
