class PatientAppointment < ApplicationRecord
  belongs_to :doctor
  belongs_to :user
  belongs_to :appointment_date
end
