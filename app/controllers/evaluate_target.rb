class LocationsController < ApplicationController
  def evaluate_target
    country = Country.find_by country_code: params[:country_code]
    price = get_price(country.panel_provider_id)

    render json: {data: @price}

  else
    input = nil

    render json: {data: "No data"}
   end

  private

    def evaluate_target_params
      params.require(:country_code, :target_group_id, :locations)
      params.require(:locations).permit(:id, :panel_size)
    end
  end
end