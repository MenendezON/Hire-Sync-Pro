require "application_system_test_case"

class Admin::CandidatesTest < ApplicationSystemTestCase
  setup do
    @admin_candidate = admin_candidates(:one)
  end

  test "visiting the index" do
    visit admin_candidates_url
    assert_selector "h1", text: "Candidates"
  end

  test "should create candidate" do
    visit admin_candidates_url
    click_on "New candidate"

    click_on "Create Candidate"

    assert_text "Candidate was successfully created"
    click_on "Back"
  end

  test "should update Candidate" do
    visit admin_candidate_url(@admin_candidate)
    click_on "Edit this candidate", match: :first

    click_on "Update Candidate"

    assert_text "Candidate was successfully updated"
    click_on "Back"
  end

  test "should destroy Candidate" do
    visit admin_candidate_url(@admin_candidate)
    click_on "Destroy this candidate", match: :first

    assert_text "Candidate was successfully destroyed"
  end
end
