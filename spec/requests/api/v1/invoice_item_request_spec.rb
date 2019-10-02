require 'rails_helper'

describe 'Invoice_item API' do
  it 'Returns all invoice_items' do
    create_list(:invoice_item, 5)

    get '/api/v1/invoice_items'

    expect(response).to be_successful

    items = JSON.parse(response.body)

    expect(items["data"].count).to eq(5)
  end
end
