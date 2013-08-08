class AddDigestToLeads < ActiveRecord::Migration
  def change
    add_column :leads, :digest, :string
  end
end
