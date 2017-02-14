class AddZipCityAndTimezoneToVisitors < ActiveRecord::Migration
  def change
    add_column :visitors, :timezone, :string
    add_column :visitors, :city, :string
    add_column :visitors, :zipcode, :string
  end
end
