class Api::V1::InvoiceItems::FindAllController < Api::V1::InvoiceItems::BaseController

  def index
    if find_params[:unit_price]
      render json: InvoiceItemSerializer.new(InvoiceItem.find_all_by_price(find_params[:unit_price]))
    else
      render json: InvoiceItemSerializer.new(InvoiceItem.find_all_by(find_params))
    end
  end
end
