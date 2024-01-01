require "test_helper"

class Admin::CandidatesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @admin_candidate = admin_candidates(:one)
  end

  test "should get index" do
    get admin_candidates_url
    assert_response :success
  end

  test "should get new" do
    get new_admin_candidate_url
    assert_response :success
  end

  test "should create admin_candidate" do
    assert_difference("Admin::Candidate.count") do
      post admin_candidates_url, params: { admin_candidate: {  } }
    end

    assert_redirected_to admin_candidate_url(Admin::Candidate.last)
  end

  test "should show admin_candidate" do
    get admin_candidate_url(@admin_candidate)
    assert_response :success
  end

  test "should get edit" do
    get edit_admin_candidate_url(@admin_candidate)
    assert_response :success
  end

  test "should update admin_candidate" do
    patch admin_candidate_url(@admin_candidate), params: { admin_candidate: {  } }
    assert_redirected_to admin_candidate_url(@admin_candidate)
  end

  test "should destroy admin_candidate" do
    assert_difference("Admin::Candidate.count", -1) do
      delete admin_candidate_url(@admin_candidate)
    end

    assert_redirected_to admin_candidates_url
  end
end
