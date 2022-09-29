class DiseaseDoctor < ApplicationRecord
  belongs_to :disease
  belongs_to :doctor
end
