class AddIsPublicToDimensions < ActiveRecord::Migration
  def change
    add_column :dimensions, :is_public, :boolean, :default => false
  end
end
