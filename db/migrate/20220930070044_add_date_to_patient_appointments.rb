class AddDateToPatientAppointments < ActiveRecord::Migration[7.0]
  def change
    add_column :patient_appointments, :date, :datetime
  end
end
