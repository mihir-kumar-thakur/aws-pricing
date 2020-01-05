class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :sku
      t.string :family
      t.string :location
      t.json :properties
      t.belongs_to :region, index: true
      t.belongs_to :offer, index: true

      t.index :sku

      t.timestamps
    end
  end
end
