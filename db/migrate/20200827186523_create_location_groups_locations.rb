class CreateLocationGroupsLocations < ActiveRecord::Migration[6.0]
  def change
    create_table :location_groups_locations, id: false do |t|
      t.integer :location_id
      t.integer :location_group_id
    end
    
    add_index :location_groups_locations, :location_id
    add_index :location_groups_locations, :location_group_id
  end
end
