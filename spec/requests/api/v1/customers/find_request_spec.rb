require 'rails_helper'

describe 'Customer find API' do
  it "Can find a single customer by any attribute" do
    customer_1 = create(:customer)
    customer_2 = create(:customer)

    get "/api/v1/customers/find?id=#{customer_1.id}"

    expect(response).to be_successful

    result = JSON.parse(response.body)

    expect(result["data"]["attributes"]["first_name"]).to eq(customer_1.first_name)

    get "/api/v1/customers/find?first_name=#{customer_2.first_name}"

    expect(response).to be_successful

    result = JSON.parse(response.body)

    expect(result["data"]["attributes"]["last_name"]).to eq(customer_2.last_name)

    get "/api/v1/customers/find?last_name=#{customer_2.last_name}"

    expect(response).to be_successful

    result = JSON.parse(response.body)
    expect(result["data"]["attributes"]["first_name"]).to eq(customer_2.first_name)
  end
end
