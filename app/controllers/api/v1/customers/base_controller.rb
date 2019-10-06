class Api::V1::Customers::BaseController < ApplicationController
  private

  def current_customer
    Customer.find(params[:id])
  end

  def find_params
    params.permit(:id, :first_name, :last_name, :created_at, :updated_at)
  end
end
