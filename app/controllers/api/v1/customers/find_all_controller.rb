class Api::V1::Customers::FindAllController < ApplicationController

  def index
    render json: CustomerSerializer.new(Customer.find_all_by(find_params))
  end

  private

  def find_params
    params.permit(:id, :first_name, :last_name, :created_at, :updated_at)
  end
end
