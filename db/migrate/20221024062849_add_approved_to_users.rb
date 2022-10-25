class AddApprovedToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :approved, :integer, default: 0
  end
end
