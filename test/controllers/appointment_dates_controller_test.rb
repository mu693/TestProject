require "test_helper"

class AppointmentDatesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @appointment_date = appointment_dates(:one)
  end

  test "should get index" do
    get appointment_dates_url
    assert_response :success
  end

  test "should get new" do
    get new_appointment_date_url
    assert_response :success
  end

  test "should create appointment_date" do
    assert_difference("AppointmentDate.count") do
      post appointment_dates_url, params: { appointment_date: { doctor_id: @appointment_date.doctor_id, end_time: @appointment_date.end_time, start_time: @appointment_date.start_time } }
    end

    assert_redirected_to appointment_date_url(AppointmentDate.last)
  end

  test "should show appointment_date" do
    get appointment_date_url(@appointment_date)
    assert_response :success
  end

  test "should get edit" do
    get edit_appointment_date_url(@appointment_date)
    assert_response :success
  end

  test "should update appointment_date" do
    patch appointment_date_url(@appointment_date), params: { appointment_date: { doctor_id: @appointment_date.doctor_id, end_time: @appointment_date.end_time, start_time: @appointment_date.start_time } }
    assert_redirected_to appointment_date_url(@appointment_date)
  end

  test "should destroy appointment_date" do
    assert_difference("AppointmentDate.count", -1) do
      delete appointment_date_url(@appointment_date)
    end

    assert_redirected_to appointment_dates_url
  end
end
