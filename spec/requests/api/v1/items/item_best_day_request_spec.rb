require 'rails_helper'

describe 'Item best day API' do
  it 'Returns the date with the most sales' do
    merchant = create(:merchant)
    item = create(:item, merchant: merchant)

    invoice_1 = create(:invoice, merchant: merchant, created_at: Time.now)
    create(:invoice_item, item: item, invoice: invoice_1)
    create(:transaction, invoice: invoice_1)

    invoice_2 = create(:invoice, merchant: merchant, created_at: Time.now)
    create(:invoice_item, item: item, invoice: invoice_2)
    create(:transaction, invoice: invoice_2)

    invoice_3 = create(:invoice, merchant: merchant, created_at: Time.now - 1.days)
    create(:invoice_item, item: item, invoice: invoice_3)
    create(:transaction, invoice: invoice_3)

    invoice_4 = create(:invoice, merchant: merchant, created_at: Time.now - 2.days)
    create(:invoice_item, item: item, invoice: invoice_4)
    create(:transaction, invoice: invoice_4)

    get "/api/v1/items/#{item.id}/best_day"

    expect(response).to be_successful
    result = JSON.parse(response.body)

    expect(result["data"]["attributes"]["best_day"]).to eq(Time.now.strftime('%Y-%m-%d'))
  end
end
