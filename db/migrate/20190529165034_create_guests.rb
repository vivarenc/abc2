class CreateGuests < ActiveRecord::Migration[5.2]
  def change
    create_table :guests do |t|
      t.integer :user_id
      t.integer :guest_id
      t.text :age_group
      t.text :name
      t.text :family
      t.text :role

      t.timestamps
    end
    add_foreign_key :user, :id
  
  end
end
