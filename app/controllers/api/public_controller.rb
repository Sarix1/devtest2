class Api::PublicController < ApplicationController
  def get_locations_for_country_code
    redirect_to controller: "LocationsController",
                    action: "get_for_country_code"
  end

  def get_target_groups_for_country_code
    redirect_to controller: "TargetGroupsController",
                    action: "get_for_country_code"
  end

  def evaluate_target
    redirect_to controller: "EvaluateTarget",
                    action: "evaluate_target"
  end
end