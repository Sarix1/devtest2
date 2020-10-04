class LocationGroup < ApplicationRecord
  belongs_to :country
  belongs_to :panel_provider
  has_and_belongs_to_many :locations, join_table: "location_groups_locations"
end
