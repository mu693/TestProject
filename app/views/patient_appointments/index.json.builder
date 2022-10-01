json.array!(@patient_appointment) do |patient_appointment|   
  json.extract! patient_appointment, :id, :title, :description   
  json.start patient_appointment.start_date   
  json.end patient_appointment.end_date   
  json.url patient_appointment_url(event, format: :html) 
end
