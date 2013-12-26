class CreatePasswords < ActiveRecord::Migration
  def change
    create_table :passwords do |t|
      t.integer :list_id
      t.string :type, :default=>'admin'
      t.string :password

      t.timestamps
    end
  end
end
