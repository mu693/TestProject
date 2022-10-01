class AddUserToPatientAppointments < ActiveRecord::Migration[7.0]
  def change
    add_reference :patient_appointments, :user, null: false, foreign_key: true
  end
end
