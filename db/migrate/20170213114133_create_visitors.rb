class CreateVisitors < ActiveRecord::Migration
  def change
    create_table :visitors do |t|
      t.string :ip_add
      t.integer :tracked_url_id
      t.string :country

      t.timestamps null: false
    end
  end
end
