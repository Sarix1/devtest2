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
      scraper = Scraper.new

      if panel_provider_id == 1
        character_a_count = scraper.count_characters("https://time.com/", "a")

        render json: {data: character_a_count / 100}

      elsif panel_provider_id == 2
        array_count = scraper.count_arrays("https://openlibrary.org/search.json?q=the+lord+of+the+rings", 10)

        render json: {data: array_count}

      elsif panel_provider_id == 3
        node_count = scraper.count_html_nodes("https://time.com/")

        render json: {data: node_count / 100}
      end

    else
      render json: {data: "Invalid panel provider ID"}   
    end
  end

  private

    def evaluate_target_params
      params.require(:country_code, :target_group_id, :locations)
      params.require(:locations).permit(:id, :panel_size)
    end
end