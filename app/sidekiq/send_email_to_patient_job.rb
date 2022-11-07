class SendEmailToPatientJob < ApplicationJob
  queue_as :mailer

  def perform(user)
    user = User.where(role: 'patient')
    PatientAppointmentMailer.appointment_created(user).deliver_now
  end
end
