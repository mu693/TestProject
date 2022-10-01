json.extract! appointment_date, :id, :doctor_id, :start_time, :end_time, :created_at, :updated_at
json.url appointment_date_url(appointment_date, format: :json)
