require "application_system_test_case"

class OrderedMedicinesTest < ApplicationSystemTestCase
  setup do
    @ordered_medicine = ordered_medicines(:one)
  end

  test "visiting the index" do
    visit ordered_medicines_url
    assert_selector "h1", text: "Ordered Medicines"
  end

  test "creating a Ordered medicine" do
    visit ordered_medicines_url
    click_on "New Ordered Medicine"

    click_on "Create Ordered medicine"

    assert_text "Ordered medicine was successfully created"
    click_on "Back"
  end

  test "updating a Ordered medicine" do
    visit ordered_medicines_url
    click_on "Edit", match: :first

    click_on "Update Ordered medicine"

    assert_text "Ordered medicine was successfully updated"
    click_on "Back"
  end

  test "destroying a Ordered medicine" do
    visit ordered_medicines_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Ordered medicine was successfully destroyed"
  end
end
