require "test_helper"

class PharmacistsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @pharmacist = pharmacists(:one)
  end

  test "should get index" do
    get pharmacists_url
    assert_response :success
  end

  test "should get new" do
    get new_pharmacist_url
    assert_response :success
  end

  test "should create pharmacist" do
    assert_difference('Pharmacist.count') do
      post pharmacists_url, params: { pharmacist: {  } }
    end

    assert_redirected_to pharmacist_url(Pharmacist.last)
  end

  test "should show pharmacist" do
    get pharmacist_url(@pharmacist)
    assert_response :success
  end

  test "should get edit" do
    get edit_pharmacist_url(@pharmacist)
    assert_response :success
  end

  test "should update pharmacist" do
    patch pharmacist_url(@pharmacist), params: { pharmacist: {  } }
    assert_redirected_to pharmacist_url(@pharmacist)
  end

  test "should destroy pharmacist" do
    assert_difference('Pharmacist.count', -1) do
      delete pharmacist_url(@pharmacist)
    end

    assert_redirected_to pharmacists_url
  end
end
