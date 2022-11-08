class Doctor < ApplicationRecord
  has_many :disease_doctors
  has_many :diseases, through: :disease_doctors, dependent: :destroy

  has_many :patient_appointments

  has_many :users, through: :patient_appointments
  has_many :appointment_dates

end
