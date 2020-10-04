class CreateTargetGroups < ActiveRecord::Migration[6.0]
  def change
    create_table :target_groups do |t|
      t.string :name
      t.integer :external_id
      t.integer :parent_id
      t.string :secret_code
      t.references :panel_provider, null: false, foreign_key: true

      t.timestamps
    end
    
    add_foreign_key :target_groups, :target_groups, column: :parent_id
  end
end
