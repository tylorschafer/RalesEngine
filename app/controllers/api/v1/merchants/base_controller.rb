class Api::V1::Merchants::BaseController < ApplicationController
  private

  def find_params
    params.permit(:id, :name, :created_at, :updated_at)
  end
end
