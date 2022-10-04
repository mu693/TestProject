class AddAppointmentDateToPatientAppointments < ActiveRecord::Migration[7.0]
  def change
    add_reference :patient_appointments, :appointment_date, null: false, foreign_key: true
  end
end
