class AddDateToDoctors < ActiveRecord::Migration[7.0]
  def change
    add_column :doctors, :start_time, :datetime, array: true, default: []
  end
end
