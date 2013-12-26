class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.string :type, :default=>'choree'
      t.string :phone
      t.integer :list_id

      t.timestamps
    end
  end
end
