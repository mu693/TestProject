class AddDoctorToPatientAppointment < ActiveRecord::Migration[7.0]
  def change
    add_reference :patient_appointments, :doctor, null: false, foreign_key: true
  end
end
