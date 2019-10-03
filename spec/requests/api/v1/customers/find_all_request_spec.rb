require 'rails_helper'

describe 'Customer find_all API' do
  it "Can find a single customer by any attribute" do
    customer_1 = create(:customer, first_name: 'Tylor')
    customer_2 = create(:customer, first_name: 'Tylor', last_name: 'Schafer')
    customer_3 = create(:customer, last_name: 'Schafer')

    get "/api/v1/customers/find_all?id=#{customer_1.id}"

    expect(response).to be_successful

    result = JSON.parse(response.body)

    expect(result["data"][0]["attributes"]["first_name"]).to eq(customer_1.first_name)

    get "/api/v1/customers/find_all?first_name=#{customer_2.first_name}"

    expect(response).to be_successful

    result = JSON.parse(response.body)

    expect(result["data"][0]["attributes"]["last_name"]).to eq(customer_1.last_name)
    expect(result["data"][1]["attributes"]["last_name"]).to eq(customer_2.last_name)

    get "/api/v1/customers/find_all?last_name=#{customer_2.last_name}"

    expect(response).to be_successful

    result = JSON.parse(response.body)

    expect(result["data"][0]["attributes"]["first_name"]).to eq(customer_2.first_name)
    expect(result["data"][1]["attributes"]["first_name"]).to eq(customer_3.first_name)
  end
end
