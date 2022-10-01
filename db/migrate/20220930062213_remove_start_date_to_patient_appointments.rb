class RemoveStartDateToPatientAppointments < ActiveRecord::Migration[7.0]
  def change
    remove_column :patient_appointments, :start_date
  end
end
