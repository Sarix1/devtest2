class Country < ApplicationRecord
  belongs_to :panel_provider
  has_many :location_groups
  has_and_belongs_to_many :target_groups, join_table: "countries_target_groups"
end
