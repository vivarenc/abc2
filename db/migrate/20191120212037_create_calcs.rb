class CreateCalcs < ActiveRecord::Migration[5.2]
  def change
    create_table :calcs do |t|
      t.integer :adults_quantity
      t.integer :kids_quantity

      t.timestamps
    end
  end
end
