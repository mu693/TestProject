class PatientAppointment < ApplicationRecord
  belongs_to :user
  has_many :notifications, :as => :notifiable, dependent: :destroy 
  scope :not_yet_done, -> { where('date > ?', Time.now) } 
  scope :previous_appointment, -> { where('date < ?', Time.now) }
end
