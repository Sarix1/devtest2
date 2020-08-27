class TargetGroup < ApplicationRecord
  belongs_to :target_group
  has_and_belongs_to_many :countries
  
  has_many :children, class_name: :target_group, foreign_key: :parent_id
  belongs_to :parent, class_name: :target_group
end
