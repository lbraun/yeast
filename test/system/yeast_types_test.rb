require "application_system_test_case"

class YeastTypesTest < ApplicationSystemTestCase
  setup do
    @yeast_type = yeast_types(:one)
  end

  test "visiting the index" do
    visit yeast_types_url
    assert_selector "h1", text: "Yeast Types"
  end

  test "creating a Yeast type" do
    visit yeast_types_url
    click_on "New Yeast Type"

    fill_in "Alm", with: @yeast_type.alm
    fill_in "Erl", with: @yeast_type.erl
    fill_in "Gvh", with: @yeast_type.gvh
    fill_in "Latitude", with: @yeast_type.latitude
    fill_in "Localization site", with: @yeast_type.localization_site
    fill_in "Longitude", with: @yeast_type.longitude
    fill_in "Mcg", with: @yeast_type.mcg
    fill_in "Mit", with: @yeast_type.mit
    fill_in "Nuc", with: @yeast_type.nuc
    fill_in "Pox", with: @yeast_type.pox
    fill_in "Sequence name", with: @yeast_type.sequence_name
    fill_in "Vac", with: @yeast_type.vac
    click_on "Create Yeast type"

    assert_text "Yeast type was successfully created"
    click_on "Back"
  end

  test "updating a Yeast type" do
    visit yeast_types_url
    click_on "Edit", match: :first

    fill_in "Alm", with: @yeast_type.alm
    fill_in "Erl", with: @yeast_type.erl
    fill_in "Gvh", with: @yeast_type.gvh
    fill_in "Latitude", with: @yeast_type.latitude
    fill_in "Localization site", with: @yeast_type.localization_site
    fill_in "Longitude", with: @yeast_type.longitude
    fill_in "Mcg", with: @yeast_type.mcg
    fill_in "Mit", with: @yeast_type.mit
    fill_in "Nuc", with: @yeast_type.nuc
    fill_in "Pox", with: @yeast_type.pox
    fill_in "Sequence name", with: @yeast_type.sequence_name
    fill_in "Vac", with: @yeast_type.vac
    click_on "Update Yeast type"

    assert_text "Yeast type was successfully updated"
    click_on "Back"
  end

  test "destroying a Yeast type" do
    visit yeast_types_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Yeast type was successfully destroyed"
  end
end
