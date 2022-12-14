class AddDoctorIdToNotifications < ActiveRecord::Migration[7.0]
  def change
    add_column :notifications, :doctor_id, :integer
  end
end
