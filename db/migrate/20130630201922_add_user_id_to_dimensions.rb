class AddUserIdToDimensions < ActiveRecord::Migration
  def change
    add_column :dimensions, :user_id, :integer, :null => false
    add_index :dimensions, :user_id, :unique => false
  end
end
