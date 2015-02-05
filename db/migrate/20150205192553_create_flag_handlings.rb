class CreateFlagHandlings < ActiveRecord::Migration
  def change
    create_table :flag_handlings do |t|
      t.integer :user_id
      t.integer :comment_id
      t.integer :result_id

      t.timestamps
    end
  end
end
