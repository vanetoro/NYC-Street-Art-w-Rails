class CreateMurals < ActiveRecord::Migration[5.2]
  def change
    create_table :murals do |t|
      t.string :location_details
      t.integer :neighborhood_id
      t.integer :artist_id
      t.integer :active, :default => 1
    end
  end
end
