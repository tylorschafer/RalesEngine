class Api::V1::Items::InvoiceItemsController < Api::V1::Items::BaseController

  def index
    render json: InvoiceItemSerializer.new(current_item.invoice_items)
  end
end
