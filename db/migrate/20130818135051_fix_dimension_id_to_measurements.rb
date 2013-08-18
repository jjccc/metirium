class FixDimensionIdToMeasurements < ActiveRecord::Migration
  def up
    change_column_null :measurements, :dimension_id, false
  end

  def down
  end
end
