class CreatePricings < ActiveRecord::Migration[6.0]
  def change
    create_table :pricings do |t|
      t.string :sku
      t.datetime :effective_date
      t.string :rate_code
      t.text :description
      t.string :begin_range
      t.string :end_range
      t.string :unit
      t.string :currency
      t.string :price_per_unit
      t.belongs_to :product, index: true

      t.index :sku

      t.timestamps
    end
  end
end
