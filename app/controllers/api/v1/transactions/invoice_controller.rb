class Api::V1::Transactions::InvoiceController < Api::V1::Transactions::BaseController

  def show
    render json: InvoiceSerializer.new(current_transaction.invoice)
  end
end
