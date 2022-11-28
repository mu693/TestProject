class PatientAppointment < ApplicationRecord
  belongs_to :user

  scope :not_yet_done, -> { where('date > ?', Time.now) } 

  scope :previous_appointment, -> { where('date < ?', Time.now) } 

end
