class RemoveUserId < ActiveRecord::Migration[5.2]
  def change
    remove_column :guests, :user_id
  end
end
