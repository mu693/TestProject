class RemoveUserToAppointmentDates < ActiveRecord::Migration[7.0]
  def change
    remove_column :appointment_dates, :user_id
  end
end
