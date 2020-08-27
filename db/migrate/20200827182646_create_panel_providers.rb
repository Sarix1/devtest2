class CreatePanelProviders < ActiveRecord::Migration[6.0]
  def change
    create_table :panel_providers do |t|
      t.string :code

      t.timestamps
    end
  end
end
