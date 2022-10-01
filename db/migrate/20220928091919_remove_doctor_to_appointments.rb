class RemoveDoctorToAppointments < ActiveRecord::Migration[7.0]
  def change
    remove_column :appointments, :doctor_id
  end
end
