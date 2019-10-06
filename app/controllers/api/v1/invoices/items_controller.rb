class Api::V1::Invoices::ItemsController < Api::V1::Invoices::BaseController

  def index
    render json: ItemSerializer.new(current_invoice.items)
  end
end
