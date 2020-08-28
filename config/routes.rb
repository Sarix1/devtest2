Rails.application.routes.draw do
  get '/test1',  to: 'api/public#test1'
  get '/test2',  to: 'api/private#test2'
end
