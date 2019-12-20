class Addreftocalc < ActiveRecord::Migration[5.2]
  def change
    add_reference :calcs, :user, foreign_key: true
  end
end
