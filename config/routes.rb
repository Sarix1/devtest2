Rails.application.routes.draw do
  get '/test1', to: 'api/public#test1'
  get '/test2', to: 'api/private#test2'
  get '/locations/:country_code', to: 'api/public#get_locations_for_country_code'
  get '/target_groups/:country_code', to: 'api/public#get_target_groups_for_country_code'
end
