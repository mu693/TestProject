class Doctor < ApplicationRecord
  has_many :disease_doctors
  has_many :diseases, through: :disease_doctors, dependent: :destroy

  has_many :patient_appointments
end
