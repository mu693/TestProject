require 'application_system_test_case'

class AppointmentDatesTest < ApplicationSystemTestCase
  setup do
    @appointment_date = appointment_dates(:one)
  end

  test 'visiting the index' do
    visit appointment_dates_url
    assert_selector 'h1', text: 'Appointment dates'
  end

  test 'should create appointment date' do
    visit appointment_dates_url
    click_on 'New appointment date'

    fill_in 'Doctor', with: @appointment_date.doctor_id
    fill_in 'End time', with: @appointment_date.end_time
    fill_in 'Start time', with: @appointment_date.start_time
    click_on 'Create Appointment date'

    assert_text 'Appointment date was successfully created'
    click_on 'Back'
  end

  test 'should update Appointment date' do
    visit appointment_date_url(@appointment_date)
    click_on 'Edit this appointment date', match: :first

    fill_in 'Doctor', with: @appointment_date.doctor_id
    fill_in 'End time', with: @appointment_date.end_time
    fill_in 'Start time', with: @appointment_date.start_time
    click_on 'Update Appointment date'

    assert_text 'Appointment date was successfully updated'
    click_on 'Back'
  end

  test 'should destroy Appointment date' do
    visit appointment_date_url(@appointment_date)
    click_on 'Destroy this appointment date', match: :first

    assert_text 'Appointment date was successfully destroyed'
  end
end
