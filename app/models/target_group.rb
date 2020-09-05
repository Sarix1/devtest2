class TargetGroup < ApplicationRecord
  belongs_to :target_group
  has_and_belongs_to_many :countries, join_table: "countries_target_groups"
  has_many :children, class_name: "TargetGroup", foreign_key: :parent_id
  belongs_to :parent, class_name: "TargetGroup"

  def self.for_country_code(country_code)
    country = Country.find_by(country_code: country_code)
    panel_provider_id = country.panel_provider_id
    target_groups = country.target_groups.where(panel_provider_id: panel_provider_id)
    
    target_group_tree = []
    get_tree(target_groups, target_group_tree, "name")

    target_group_tree
  end

  def self.get_tree(argument_array, destination_array, item_attribute)
    argument_array.each do |item|
      destination_array << item[item_attribute]
  
      unless item.children == nil
        item_kids = item.children
        get_tree(item_kids, destination_array, item_attribute)
      end
    end
  end
end
