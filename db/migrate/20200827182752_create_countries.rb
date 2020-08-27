class CreateCountries < ActiveRecord::Migration[6.0]
  def change
    create_table :countries do |t|
      t.string :country_code
      t.references :panel_provider, null: false, foreign_key: true

      t.timestamps
    end
  end
end
