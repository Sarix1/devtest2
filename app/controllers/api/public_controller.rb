class Api::PublicController < ApplicationController
  def get_locations_for_country_code
    render json: Location.for_country_code(params[:country_code])
  end

  def get_target_groups_for_country_code
    render json: TargetGroup.for_country_code(params[:country_code])
  end

  def evaluate_target
    country = Country.find_by country_code: params[:country_code]
    panel_provider_id = country.panel_provider_id

    if panel_provider_id.in?([1, 2, 3])
      calculator = Calculator.new

      render json: calculator.calculate(panel_provider_id)

    else
      render json: "Invalid panel provider ID"

    end
  end

  private

    def evaluate_target_params
      params.require(:country_code, :target_group_id, :locations)
      params.require(:locations).permit(:id, :panel_size)
    end
end
