class CreateCosts < ActiveRecord::Migration[5.2]
  def change
    create_table :costs do |t|
      t.string :cost_type
      t.decimal :amount
      t.text :notes

      t.timestamps
    end
  end
end
