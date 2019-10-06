class Api::V1::InvoiceItems::BaseController < ApplicationController

  private

  def current_invoice_item
    InvoiceItem.find(params[:id])
  end

  def find_params
    params.permit(:id, :item_id, :invoice_id, :quantity, :unit_price, :created_at, :updated_at)
  end

end
