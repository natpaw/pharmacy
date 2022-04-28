require "test_helper"

class OrderedMedicinesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @ordered_medicine = ordered_medicines(:one)
  end

  test "should get index" do
    get ordered_medicines_url
    assert_response :success
  end

  test "should get new" do
    get new_ordered_medicine_url
    assert_response :success
  end

  test "should create ordered_medicine" do
    assert_difference('OrderedMedicine.count') do
      post ordered_medicines_url, params: { ordered_medicine: {  } }
    end

    assert_redirected_to ordered_medicine_url(OrderedMedicine.last)
  end

  test "should show ordered_medicine" do
    get ordered_medicine_url(@ordered_medicine)
    assert_response :success
  end

  test "should get edit" do
    get edit_ordered_medicine_url(@ordered_medicine)
    assert_response :success
  end

  test "should update ordered_medicine" do
    patch ordered_medicine_url(@ordered_medicine), params: { ordered_medicine: {  } }
    assert_redirected_to ordered_medicine_url(@ordered_medicine)
  end

  test "should destroy ordered_medicine" do
    assert_difference('OrderedMedicine.count', -1) do
      delete ordered_medicine_url(@ordered_medicine)
    end

    assert_redirected_to ordered_medicines_url
  end
end
