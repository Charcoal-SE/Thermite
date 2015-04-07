class AddIsFailingToFilter < ActiveRecord::Migration
  def change
    add_column :filters, :is_failing, :boolean
  end
end
