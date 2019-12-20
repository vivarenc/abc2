class CreateServices < ActiveRecord::Migration[5.2]
  def change
    create_table :services do |t|
      t.integer :service_id
      t.integer :user_id
      t.string :type
      t.string :name
      t.string :location
      t.string :website
      t.string :contact
      t.string :description

      t.timestamps
    end
  end
end
