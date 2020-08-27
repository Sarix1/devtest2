class CreateCountriesTargetGroups < ActiveRecord::Migration[6.0]
  def change
    create_table :countries_target_groups, id: false do |t|
      t.integer :country_id
      t.integer :target_group_id
    end
    
    add_index :countries_target_groups, :country_id
    add_index :countries_target_groups, :target_group_id
  end
end
