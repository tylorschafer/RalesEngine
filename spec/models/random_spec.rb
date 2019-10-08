require 'rails_helper'

describe 'random generator' do
  it 'returns a random record of resource' do
    item_1 = create(:item)
    item_2 = create(:item)
    item_3 = create(:item)
    items = [item_1, item_2, item_3]

    expect(items.include?(Item.random)).to be_truthy
  end
end
