class RemoveStartTimeToPatientAppointments < ActiveRecord::Migration[7.0]
  def change
    remove_column :patient_appointments, :start_time
  end
end
