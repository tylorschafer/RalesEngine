require 'rails_helper'

describe 'Merchants API' do
  it "Returns all merchants" do
    create_list(:merchant, 5)

    get '/api/v1/merchants'

    expect(response).to be_successful

    items = JSON.parse(response.body)

    expect(items["data"].count).to eq(5)
  end
end
