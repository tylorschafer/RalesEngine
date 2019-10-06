class Api::V1::InvoiceItems::ItemController < Api::V1::InvoiceItems::BaseController

  def show
    render json: ItemSerializer.new(current_invoice_item.item)
  end
end
