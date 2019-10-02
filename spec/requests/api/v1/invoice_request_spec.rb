require 'rails_helper'

describe 'Invoices API' do
  it 'Returns all invoice' do
    create_list(:invoice, 5)

    get '/api/v1/invoices'

    expect(response).to be_successful

    items = JSON.parse(response.body)

    expect(items["data"].count).to eq(5)
  end
end
