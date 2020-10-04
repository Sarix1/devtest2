class CreateLocationGroups < ActiveRecord::Migration[6.0]
  def change
    create_table :location_groups do |t|
      t.string :name
      t.references :country, null: false, foreign_key: true
      t.references :panel_provider, null: false, foreign_key: true

      t.timestamps
    end
  end
end
