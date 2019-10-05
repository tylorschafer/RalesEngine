class Api::V1::InvoiceItems::FindController < Api::V1::InvoiceItems::BaseController

  def show
    if find_params[:unit_price]
      render json: InvoiceItemSerializer.new(InvoiceItem.find_by_price(find_params[:unit_price]))
    else
      render json: InvoiceItemSerializer.new(InvoiceItem.find_by(find_params))
    end
  end
end
