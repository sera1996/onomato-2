require "application_system_test_case"

class OnomatopoeiaTest < ApplicationSystemTestCase
  setup do
    @onomatopoeium = onomatopoeia(:one)
  end

  test "visiting the index" do
    visit onomatopoeia_url
    assert_selector "h1", text: "Onomatopoeia"
  end

  test "creating a Onomatopoeium" do
    visit onomatopoeia_url
    click_on "New Onomatopoeium"

    fill_in "Name", with: @onomatopoeium.name
    click_on "Create Onomatopoeium"

    assert_text "Onomatopoeium was successfully created"
    click_on "Back"
  end

  test "updating a Onomatopoeium" do
    visit onomatopoeia_url
    click_on "Edit", match: :first

    fill_in "Name", with: @onomatopoeium.name
    click_on "Update Onomatopoeium"

    assert_text "Onomatopoeium was successfully updated"
    click_on "Back"
  end

  test "destroying a Onomatopoeium" do
    visit onomatopoeia_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Onomatopoeium was successfully destroyed"
  end
end
