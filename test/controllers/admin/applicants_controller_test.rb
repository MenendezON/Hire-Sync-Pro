require "test_helper"

class Admin::ApplicantsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @admin_applicant = admin_applicants(:one)
  end

  test "should get index" do
    get admin_applicants_url
    assert_response :success
  end

  test "should get new" do
    get new_admin_applicant_url
    assert_response :success
  end

  test "should create admin_applicant" do
    assert_difference("Admin::Applicant.count") do
      post admin_applicants_url, params: { admin_applicant: {  } }
    end

    assert_redirected_to admin_applicant_url(Admin::Applicant.last)
  end

  test "should show admin_applicant" do
    get admin_applicant_url(@admin_applicant)
    assert_response :success
  end

  test "should get edit" do
    get edit_admin_applicant_url(@admin_applicant)
    assert_response :success
  end

  test "should update admin_applicant" do
    patch admin_applicant_url(@admin_applicant), params: { admin_applicant: {  } }
    assert_redirected_to admin_applicant_url(@admin_applicant)
  end

  test "should destroy admin_applicant" do
    assert_difference("Admin::Applicant.count", -1) do
      delete admin_applicant_url(@admin_applicant)
    end

    assert_redirected_to admin_applicants_url
  end
end
