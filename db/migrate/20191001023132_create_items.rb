class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.string :name
      t.string :description
      t.string :unit_price
      t.string :integer
      t.references :merchant, foreign_key: true

      t.timestamps
    end
  end
end
