class CreateAppointmentDates < ActiveRecord::Migration[7.0]
  def change
    create_table :appointment_dates do |t|
      t.references :doctor, null: false, foreign_key: true
      t.datetime :start_time
      t.datetime :end_time

      t.timestamps
    end
  end
end
