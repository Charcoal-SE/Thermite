class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :site
      t.integer :comment_id
      t.string :text
      t.integer :user_id
      t.timestamp :creation_date

      t.timestamps
    end
  end
end
