class AddUserToGuests < ActiveRecord::Migration[5.2]
  def change
    add_reference :guests, :user, foreign_key: true
  end
end
