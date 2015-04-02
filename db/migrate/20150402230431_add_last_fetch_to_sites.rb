class AddLastFetchToSites < ActiveRecord::Migration
  def change
    add_column :sites, :last_comment_fetch, :datetime
  end
end
