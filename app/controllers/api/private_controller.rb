class Api::PrivateController < ApplicationController

  include ActionController::HttpAuthentication::Basic::ControllerMethods
  before_action :http_basic_authenticate

  def test1
    render json: {data: "Testing 1"}
  end

  def test2
    render json: {data: "Testing 2"}
  end

  def http_basic_authenticate
    authenticate_or_request_with_http_basic do |name, password|
      name == "admin" && password == "pw"
    end
  end
end
  