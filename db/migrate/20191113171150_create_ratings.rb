class CreateRatings < ActiveRecord::Migration[5.2]
  def change
    create_table :ratings do |t|
      t.integer :rate
      t.text :comment
      t.string :signature

      t.timestamps
    end
  end
end
