class AddIsFlaggedAndFlagReasonToComments < ActiveRecord::Migration
  def change
    add_column :comments, :is_flagged, :boolean
    add_column :comments, :flag_reason, :string
  end
end
