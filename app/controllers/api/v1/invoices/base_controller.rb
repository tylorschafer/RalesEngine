class Api::V1::Invoices::BaseController < ApplicationController

  private

  def find_params
    params.permit(:id, :merchant_id, :customer_id, :status)
  end

end
