class AddAveragePriceToStations < ActiveRecord::Migration[5.1]
  def change
    add_column :stations, :average_price, :integer
  end
end
