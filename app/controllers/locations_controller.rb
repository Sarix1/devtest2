class LocationsController < ApplicationController
  def get_for_country_code
    country = Country.find_by country_code: params[:country_code]
    location_group_ids = LocationGroup.where(country_id: country.id, panel_provider_id: country.panel_provider_id).pluck(:id)
    location_ids = LocationGroupsLocation.where(location_group_id: location_group_ids).pluck(:location_id)
    locations = Location.where(id: location_ids).pluck(:name)

    render json: {data: locations}
  end
end