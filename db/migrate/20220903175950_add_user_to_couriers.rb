class AddUserToCouriers < ActiveRecord::Migration[7.0]
  def change
    add_reference :couriers, :user, null: false, foreign_key: true
  end
end
