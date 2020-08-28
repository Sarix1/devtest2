class Api::PublicController < ApplicationController
  def test
    render json: {data: "Testing"}
  end
end
