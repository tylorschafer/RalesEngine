class Api::V1::Invoices::BaseController < ApplicationController
  private

  def current_invoice
    Invoice.find(params[:id])
  end

  def find_params
    params.permit(:id, :merchant_id, :customer_id, :status, :created_at, :updated_at)
  end
end
