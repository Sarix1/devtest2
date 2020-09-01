Rails.application.routes.draw do
  get '/private/locations/:country_code',      to: 'api/private#get_locations_for_country_code'
  get '/private/target_groups/:country_code',  to: 'api/private#get_target_groups_for_country_code'
  post '/private/evaluate_target',             to: 'api/private#evaluate_target'

  get '/public/locations/:country_code',       to: 'api/public#get_locations_for_country_code'
  get '/public/target_groups/:country_code',   to: 'api/public#get_target_groups_for_country_code'
end
