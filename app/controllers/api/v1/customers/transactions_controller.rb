class Api::V1::Customers::TransactionsController < Api::V1::Customers::BaseController

  def index
    render json: TransactionSerializer.new(current_customer.transactions)
  end
end
