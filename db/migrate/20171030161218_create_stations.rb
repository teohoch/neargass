class CreateStations < ActiveRecord::Migration[5.1]
  def change
    create_table :stations do |t|
      t.string :code
      t.string :business_name
      t.string :address_street
      t.string :address_number
      t.references :commune, foreign_key: true
      t.references :distributor, foreign_key: true
      t.string :schedule
      t.boolean :cash
      t.boolean :check
      t.boolean :bank_card
      t.boolean :shop_card
      t.point :location
      t.boolean :shop
      t.boolean :pharmacy
      t.boolean :maintenance
      t.boolean :self_service
      t.timestamps
    end
  end
end
