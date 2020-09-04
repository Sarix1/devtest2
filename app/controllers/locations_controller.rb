class LocationsController < ApplicationController
  def get_for_country_code(country_code)
    locations =
      Location.joins(location_groups: :country)
              .where(countries: { country_code: country_code })
              .to_a

    render json: { data: locations }
  end
end