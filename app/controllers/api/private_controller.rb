class Api::PrivateController < Api::PublicController
  include ActionController::HttpAuthentication::Basic::ControllerMethods
  before_action :http_basic_authenticate

  private

    def http_basic_authenticate
      authenticate_or_request_with_http_basic do |name, password|
        name == "admin" && password == "pw"
      end
    end
end