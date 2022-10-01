class AddStartTimeToPatientAppointments < ActiveRecord::Migration[7.0]
  def change
    add_column :patient_appointments, :start_time, :datetime
  end
end
