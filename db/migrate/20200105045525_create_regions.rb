class CreateRegions < ActiveRecord::Migration[6.0]
  def change
    create_table :regions do |t|
      t.string :name
      t.string :code

      t.index :name

      t.timestamps
    end
  end
end
