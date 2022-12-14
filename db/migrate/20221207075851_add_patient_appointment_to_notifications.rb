class AddPatientAppointmentToNotifications < ActiveRecord::Migration[7.0]
  def change
    add_reference :notifications, :patient_appointment, null: true, foreign_key: true
  end
end
