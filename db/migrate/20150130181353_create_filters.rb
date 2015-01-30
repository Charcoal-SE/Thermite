class CreateFilters < ActiveRecord::Migration
  def change
    create_table :filters do |t|
      t.string :reason
      t.integer :site
      t.string :regex
      t.integer :created_by

      t.timestamps
    end
  end
end
