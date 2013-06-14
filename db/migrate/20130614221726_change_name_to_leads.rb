class ChangeNameToLeads < ActiveRecord::Migration
  def up
    change_column :leads, :name, :string, :null => true
  end

  def down
    change_column :leads, :name, :string, :null => false
  end
end
