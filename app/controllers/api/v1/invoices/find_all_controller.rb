class Api::V1::Invoices::FindAllController < Api::V1::Invoices::BaseController

  def index
    render json: InvoiceSerializer.new(Invoice.find_all_by(find_params))
  end
end
