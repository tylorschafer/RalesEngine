class Api::V1::Transactions::FindController < Api::V1::Transactions::BaseController

  def show
    render json: TransactionSerializer.new(Transaction.find_by(find_params))
  end
end
