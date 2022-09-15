require "application_system_test_case"

class DiseasesTest < ApplicationSystemTestCase
  setup do
    @disease = diseases(:one)
  end

  test "visiting the index" do
    visit diseases_url
    assert_selector "h1", text: "Diseases"
  end

  test "should create disease" do
    visit diseases_url
    click_on "New disease"

    click_on "Create Disease"

    assert_text "Disease was successfully created"
    click_on "Back"
  end

  test "should update Disease" do
    visit disease_url(@disease)
    click_on "Edit this disease", match: :first

    click_on "Update Disease"

    assert_text "Disease was successfully updated"
    click_on "Back"
  end

  test "should destroy Disease" do
    visit disease_url(@disease)
    click_on "Destroy this disease", match: :first

    assert_text "Disease was successfully destroyed"
  end
end
