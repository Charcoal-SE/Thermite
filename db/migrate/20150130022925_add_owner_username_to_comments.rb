class AddOwnerUsernameToComments < ActiveRecord::Migration
  def change
    add_column :comments, :owner_username, :string
  end
end
