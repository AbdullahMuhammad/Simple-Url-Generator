class CreateTrackedUrls < ActiveRecord::Migration
  def change
    create_table :tracked_urls do |t|
      t.string :name
      t.integer :destination_url_id
      t.boolean :status, default: true

      t.timestamps null: false
    end
  end
end
