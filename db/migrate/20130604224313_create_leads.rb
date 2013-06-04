class CreateLeads < ActiveRecord::Migration
  def change
    create_table :leads do |t|
      t.string :name, :null => false, :limit => 150
      t.string :email, :null => false, :limit => 250

      t.timestamps
    end
  end
end
