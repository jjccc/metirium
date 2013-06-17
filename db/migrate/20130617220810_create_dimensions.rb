class CreateDimensions < ActiveRecord::Migration
  def change
    create_table :dimensions do |t|
      t.string :name, :null => false, :limit => 250
      t.integer :fact_id

      t.timestamps
    end
  end
end
