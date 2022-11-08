module PatientAppointments
  ActiveSupport::Concern

  def create
    if params[:doctor].present? && params[:date].present?
      s = params[:date].delete! '""'
      date = Date.parse(s)
      @patient_appointment = current_user.patient_appointments.create(doctor_id: params[:doctor], date: date)
      user = current_user
      @user = user.email
      PatientAppointmentMailer.appointment_created(@user).deliver_now
    end
    respond_to do |format|
      SendEmailToPatientJob.perform_later
      redirect_to patient_appointments_url
      flash[:notice] = 'Appointmen was successfully created.'
    end
  end

  def patient_appointment_params
    params.require(:patient_appointment).permit(:doctor_id, :date)
  end

  def current_appointment
    @patient_appointment = PatientAppointment.find(params[:id])
  end

end  