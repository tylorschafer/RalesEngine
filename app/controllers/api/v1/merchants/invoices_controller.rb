class Api::V1::Merchants::InvoicesController < Api::V1::Merchants::BaseController

  def index
    render json: InvoiceSerializer.new(current_merchant.invoices)
  end
end
