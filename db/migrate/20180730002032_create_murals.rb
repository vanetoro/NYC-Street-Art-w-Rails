class CreateMurals < ActiveRecord::Migration[5.2]
  def change
    create_table :murals do |t|
      t.string :name
      t.integer :neighborhood_id
      t.integer :artist_id
    end
  end
end
