class RemoveStartTimeToDoctors < ActiveRecord::Migration[7.0]
  def change
    remove_column :doctors, :start_time
  end
end
