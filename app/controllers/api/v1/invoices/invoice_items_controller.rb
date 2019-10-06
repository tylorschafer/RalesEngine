class Api::V1::Invoices::InvoiceItemsController < Api::V1::Invoices::BaseController

  def index
    render json: InvoiceItemSerializer.new(current_invoice.invoice_items)
  end
end
