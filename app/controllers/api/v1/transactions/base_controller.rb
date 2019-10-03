class Api::V1::Transactions::BaseController < ApplicationController

  private

  def find_params
    params.permit(:id, :invoice_id, :credit_card_number, :result, :created_at, :updated_at)
  end
end
