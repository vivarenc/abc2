class Renameservicetype < ActiveRecord::Migration[5.2]
  def change
    rename_column :services, :type, :service_type
  end
end
