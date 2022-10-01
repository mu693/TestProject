class AddEndTimeToDoctors < ActiveRecord::Migration[7.0]
  def change
    add_column :doctors, :end_time, :datetime, array: true, default: []
  end
end
