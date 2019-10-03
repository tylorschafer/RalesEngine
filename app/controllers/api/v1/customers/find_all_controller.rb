class Api::V1::Customers::FindAllController < Api::V1::Customers::BaseController

  def index
    render json: CustomerSerializer.new(Customer.find_all_by(find_params))
  end
end
