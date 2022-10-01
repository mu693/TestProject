class RemoveEndTimeToPatientAppointments < ActiveRecord::Migration[7.0]
  def change
    remove_column :patient_appointments, :end_time
  end
end
