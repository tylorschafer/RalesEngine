require 'rails_helper'

describe 'Merchant favorite customer API' do
  it 'Returns the merchant customer who has the most successful transactions' do
    merchant = create(:merchant)
    customer_1 = create(:customer)
    customer_2 = create(:customer)
    customer_3 = create(:customer)

    invoice_1 = create(:invoice, merchant: merchant, customer: customer_1)
    invoice_2 = create(:invoice, merchant: merchant, customer: customer_1)
    invoice_3 = create(:invoice, merchant: merchant, customer: customer_1)
    invoice_4 = create(:invoice, merchant: merchant, customer: customer_2)
    invoice_5 = create(:invoice, merchant: merchant, customer: customer_3)

    create(:transaction, invoice: invoice_1)
    create(:transaction, invoice: invoice_2)
    create(:transaction, invoice: invoice_3)
    create(:transaction, invoice: invoice_4)
    create(:transaction, invoice: invoice_5)

  end
end
