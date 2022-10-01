class RemoveEndTimeToDoctors < ActiveRecord::Migration[7.0]
  def change
    remove_column :doctors, :end_time
  end
end
