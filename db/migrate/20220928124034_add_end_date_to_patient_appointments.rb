class AddEndDateToPatientAppointments < ActiveRecord::Migration[7.0]
  def change
    add_column :patient_appointments, :end_time, :datetime
  end
end
