class TargetGroupsController < ApplicationController
  def get_for_country_code
    country = Country.find_by country_code: params[:country_code]
    target_group_ids = CountriesTargetGroup.where(country_id: country.id).pluck(:target_group_id)
    target_groups = TargetGroup.where(id: target_group_ids, panel_provider_id: country.panel_provider_id)
    target_group_tree = Array.new
    get_tree(target_groups, target_group_tree, "name")

    render json: {data: target_group_tree}
  end

  private

    def get_tree(argument_array, destination_array, item_attribute)
      argument_array.each do |item|
        destination_array << item[item_attribute]

        unless item.children == nil
          item_kids = item.children
          get_tree(item_kids, destination_array, item_attribute)
        end
      end
    end
end