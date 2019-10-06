class Api::V1::Invoices::MerchantController < Api::V1::Invoices::BaseController

  def show
    render json: MerchantSerializer.new(current_invoice.merchant)
  end
end
