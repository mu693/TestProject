class SendEmailToPatientJob < ApplicationJob
  queue_as :mailer

  def perform(user)
    user = User.where(role: "patient")
    user.appointment_created
  end
end
