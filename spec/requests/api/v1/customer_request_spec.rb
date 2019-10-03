require 'rails_helper'

describe 'Customer API' do
  it 'Returns all customers' do
    create_list(:customer, 5)

    get '/api/v1/customers'

    expect(response).to be_successful

    items = JSON.parse(response.body)

    expect(items["data"].count).to eq(5)
  end

  it "Returns a single customer" do
    customer = create(:customer)

    get "/api/v1/customers/#{customer.id}"

    expect(response).to be_successful

    result = JSON.parse(response.body)

    expect(result["data"]["attributes"]["id"]).to eq(customer.id)
  end
end
