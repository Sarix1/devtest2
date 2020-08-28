Rails.application.routes.draw do
  get '/test', to: 'api/public#test'
end
