class Api::V1::Invoices::CustomerController < Api::V1::Invoices::BaseController

  def show
    render json: CustomerSerializer.new(current_invoice.customer)
  end
end
