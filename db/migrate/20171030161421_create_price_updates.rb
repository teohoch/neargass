class CreatePriceUpdates < ActiveRecord::Migration[5.1]
  def change
    create_table :price_updates do |t|
      t.references :station, foreign_key: true
      t.integer :gas_93
      t.integer :gas_95
      t.integer :gas_97
      t.integer :diesel
      t.integer :gnc
      t.integer :glp
      t.boolean :current

      t.timestamps
    end
  end
end
