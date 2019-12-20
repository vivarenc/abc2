class AddUserToServices < ActiveRecord::Migration[5.2]
  def change
    remove_column :services, :user_id
    add_reference :services, :user, foreign_key: true
  end
end
