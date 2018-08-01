class AddUserIdToMurals < ActiveRecord::Migration[5.2]
  def change
    add_column :murals, :user_id, :integer
  end
end
