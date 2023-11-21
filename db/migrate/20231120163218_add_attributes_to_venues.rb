class AddAttributesToVenues < ActiveRecord::Migration[7.1]
  def change
    add_column :venues, :price_per_hour, :integer
    add_column :venues, :name, :string
    add_column :venues, :description, :text
    add_column :venues, :location, :string
    add_column :venues, :capacity, :integer
  end
end
