class Api::V1::Customers::FindController < Api::V1::Customers::BaseController

  def show
    render json: CustomerSerializer.new(Customer.find_by(find_params))
  end
end
