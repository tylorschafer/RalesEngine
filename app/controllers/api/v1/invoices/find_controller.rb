class Api::V1::Invoices::FindController < Api::V1::Invoices::BaseController

  def show
    render json: InvoiceSerializer.new(Invoice.find_by(find_params))
  end
end
