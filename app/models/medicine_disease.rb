class MedicineDisease < ApplicationRecord
  # attr_accessible :medicine_id, :disease_id
  belongs_to :medicine
  belongs_to :disease
end
