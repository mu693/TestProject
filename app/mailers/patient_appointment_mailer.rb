class PatientAppointmentMailer < ApplicationMailer
  def property_created(user)
    mail(
      to: current_user.email,
      from: "admin_rtc@gmail.com"
      subject: "Appointment created",
      body: "Appointment has been successfully created. Please review it."
     )
  end  
end
# to: "admin@tgmalim-directory.com",
# from: user.email,