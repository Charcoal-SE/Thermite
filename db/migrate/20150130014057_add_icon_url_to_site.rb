class AddIconUrlToSite < ActiveRecord::Migration
  def change
    add_column :sites, :icon_url, :string
  end
end
