class CreateMeasurements < ActiveRecord::Migration
  def change
    create_table :measurements do |t|
      t.string :name, :null => false, :limit => 250
      t.integer :dimension_id

      t.timestamps
    end
  end
end
