class AddVisitsCountToTrackedUrls < ActiveRecord::Migration
  def change
    add_column :tracked_urls, :visitors_count, :integer
  end
end
