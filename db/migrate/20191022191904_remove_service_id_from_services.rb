class RemoveServiceIdFromServices < ActiveRecord::Migration[5.2]
  def change
    remove_column :services, :service_id
  end
end
