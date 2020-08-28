class Api::PublicController < Api::PrivateController
  skip_before_action :http_basic_authenticate, only: [:test1]
end
