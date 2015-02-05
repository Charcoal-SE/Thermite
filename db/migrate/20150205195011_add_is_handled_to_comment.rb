class AddIsHandledToComment < ActiveRecord::Migration
  def change
    add_column :comments, :is_handled, :boolean, null: false, default: false
  end
end
