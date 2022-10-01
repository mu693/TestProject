class AddDateToPatientAppointment < ActiveRecord::Migration[7.0]
  def change
    add_column :patient_appointments, :start_date, :datetime
  end
end
