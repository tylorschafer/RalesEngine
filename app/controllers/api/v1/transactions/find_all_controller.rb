class Api::V1::Transactions::FindAllController < Api::V1::Transactions::BaseController

  def index
    render json: TransactionSerializer.new(Transaction.find_all_by(find_params))
  end
end
