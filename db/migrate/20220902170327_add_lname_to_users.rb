class AddLnameToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :lname, :string
  end
end
