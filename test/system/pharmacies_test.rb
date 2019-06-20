require "application_system_test_case"

class PharmaciesTest < ApplicationSystemTestCase
  setup do
    @pharmacy = pharmacies(:one)
  end

  test "visiting the index" do
    visit pharmacies_url
    assert_selector "h1", text: "Pharmacies"
  end

  test "creating a Pharmacy" do
    visit pharmacies_url
    click_on "New Pharmacy"

    fill_in "City", with: @pharmacy.city
    fill_in "Email", with: @pharmacy.email
    fill_in "Fax", with: @pharmacy.fax
    fill_in "Name", with: @pharmacy.name
    fill_in "Phone", with: @pharmacy.phone
    fill_in "Street", with: @pharmacy.street
    fill_in "Zip", with: @pharmacy.zip
    click_on "Create Pharmacy"

    assert_text "Pharmacy was successfully created"
    click_on "Back"
  end

  test "updating a Pharmacy" do
    visit pharmacies_url
    click_on "Edit", match: :first

    fill_in "City", with: @pharmacy.city
    fill_in "Email", with: @pharmacy.email
    fill_in "Fax", with: @pharmacy.fax
    fill_in "Name", with: @pharmacy.name
    fill_in "Phone", with: @pharmacy.phone
    fill_in "Street", with: @pharmacy.street
    fill_in "Zip", with: @pharmacy.zip
    click_on "Update Pharmacy"

    assert_text "Pharmacy was successfully updated"
    click_on "Back"
  end

  test "destroying a Pharmacy" do
    visit pharmacies_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Pharmacy was successfully destroyed"
  end
end
