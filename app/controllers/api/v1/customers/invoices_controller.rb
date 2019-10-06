class Api::V1::Customers::InvoicesController < Api::V1::Customers::BaseController

  def index
    render json: InvoiceSerializer.new(current_customer.invoices)
  end
end
