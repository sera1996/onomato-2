require "application_system_test_case"

class FavorsTest < ApplicationSystemTestCase
  setup do
    @favor = favors(:one)
  end

  test "visiting the index" do
    visit favors_url
    assert_selector "h1", text: "Favors"
  end

  test "creating a Favor" do
    visit favors_url
    click_on "New Favor"

    fill_in "Survey", with: @favor.survey_id
    click_on "Create Favor"

    assert_text "Favor was successfully created"
    click_on "Back"
  end

  test "updating a Favor" do
    visit favors_url
    click_on "Edit", match: :first

    fill_in "Survey", with: @favor.survey_id
    click_on "Update Favor"

    assert_text "Favor was successfully updated"
    click_on "Back"
  end

  test "destroying a Favor" do
    visit favors_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Favor was successfully destroyed"
  end
end
