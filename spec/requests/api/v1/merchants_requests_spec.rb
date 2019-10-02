require 'rails_helper'

describe 'Merchants API' do
  it "Returns the top merchants ranked by revenue" do
    bob = create(:merchant)
    allow(bob).to receive(:total_revenue).and_return(10000)
    rob = create(:merchant)
    allow(rob).to receive(:total_revenue).and_return(1000)
    cob = create(:merchant)
    allow(cob).to receive(:total_revenue).and_return(2000)
    hobb = create(:merchant)
    allow(hobb).to receive(:total_revenue).and_return(3000)
    knob = create(:merchant)
    allow(knob).to receive(:total_revenue).and_return(4000)

    get '/api/v1/merchants/most_revenue?quantity=3'

    result = JSON.parse(response.body)

    expect(result).to be_successful
    expect(result["data"].count).to eq(3)
    expect(result["data"]).to have_content(bob.name)
    expect(result["data"]).to have_content(knob.name)
    expect(result["data"]).to have_content(hobb.name)
  end
end
