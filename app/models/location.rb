class Location < ApplicationRecord
  has_and_belongs_to_many :location_groups, join_table: "location_groups_locations"

  def self.for_country_code(country_code)
    joins(location_groups: :country)
      .where(countries: { country_code: country_code })
      .to_a
  end
end
