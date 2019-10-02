require 'rails_helper'

describe 'Customer API' do
  it 'Returns all customers' do
    create_list(:customer, 5)

    get '/api/v1/customers'

    expect(response).to be_successful

    items = JSON.parse(response.body)

    expect(items["data"].count).to eq(5)
  end
end
