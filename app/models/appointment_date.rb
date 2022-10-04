class AppointmentDate < ApplicationRecord
  belongs_to :doctor
  has_many :patient_appointments
end
