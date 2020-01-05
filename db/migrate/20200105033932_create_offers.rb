class CreateOffers < ActiveRecord::Migration[6.0]
  def change
    create_table :offers do |t|
      t.string :code
      t.string :version
      t.datetime :publication_date
      t.index :code

      t.timestamps
    end
  end
end
