class CreateDistributors < ActiveRecord::Migration[5.1]
  def change
    create_table :distributors do |t|
      t.string :name
      t.string :logo
      t.string :logo_svg
      t.string :logo_horizontal_svg

      t.timestamps
    end
  end
end
