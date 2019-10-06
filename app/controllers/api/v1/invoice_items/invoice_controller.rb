class Api::V1::InvoiceItems::InvoiceController < Api::V1::InvoiceItems::BaseController

  def show
    render json: InvoiceSerializer.new(current_invoice_item.invoice)
  end
end
