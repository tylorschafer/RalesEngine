class Api::V1::Invoices::TransactionsController < Api::V1::Invoices::BaseController

  def index
    render json: TransactionSerializer.new(current_invoice.transactions)
  end
end
