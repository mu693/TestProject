class PatientAppointmentMailer < ApplicationMailer
  def appointment_created(user)
    @user = user
    mail(
      to: @user,
      from: 'admin_rtc@gmail.com',
      subject: 'Appointment created'
      # body: "Appointment has been successfully created. Please review it."
    )
  end
end
