class CreateDestinationUrls < ActiveRecord::Migration
  def change
    create_table :destination_urls do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
