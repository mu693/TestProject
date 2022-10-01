class CreatePatientAppointments < ActiveRecord::Migration[7.0]
  def change
    create_table :patient_appointments do |t|

      t.timestamps
    end
  end
end
