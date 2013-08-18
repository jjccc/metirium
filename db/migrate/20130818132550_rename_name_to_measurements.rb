class RenameNameToMeasurements < ActiveRecord::Migration
  def up
    change_column_null :measurements, :name, true
    rename_column :measurements, :name, :comment
  end

  def down
  end
end
