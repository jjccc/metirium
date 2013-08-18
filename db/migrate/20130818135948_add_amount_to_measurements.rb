class AddAmountToMeasurements < ActiveRecord::Migration
  def change
    add_column :measurements, :amount, :float, :null => true
  end
end
