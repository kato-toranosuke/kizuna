require "application_system_test_case"

class RestSearchModelsTest < ApplicationSystemTestCase
  setup do
    @rest_search_model = rest_search_models(:one)
  end

  test "visiting the index" do
    visit rest_search_models_url
    assert_selector "h1", text: "Rest Search Models"
  end

  test "creating a Rest search model" do
    visit rest_search_models_url
    click_on "New Rest Search Model"

    fill_in "Alcohol", with: @rest_search_model.alcohol
    fill_in "Friday", with: @rest_search_model.friday
    fill_in "Googlemap", with: @rest_search_model.googlemap
    fill_in "Homepage", with: @rest_search_model.homepage
    fill_in "Mask", with: @rest_search_model.mask
    fill_in "Monday", with: @rest_search_model.monday
    fill_in "Name", with: @rest_search_model.name
    fill_in "Saturday", with: @rest_search_model.saturday
    fill_in "Sunday", with: @rest_search_model.sunday
    fill_in "Tabelog", with: @rest_search_model.tabelog
    fill_in "Takeout", with: @rest_search_model.takeout
    fill_in "Temp", with: @rest_search_model.temp
    fill_in "Thursday", with: @rest_search_model.thursday
    fill_in "Tuesday", with: @rest_search_model.tuesday
    fill_in "Wednesday", with: @rest_search_model.wednesday
    click_on "Create Rest search model"

    assert_text "Rest search model was successfully created"
    click_on "Back"
  end

  test "updating a Rest search model" do
    visit rest_search_models_url
    click_on "Edit", match: :first

    fill_in "Alcohol", with: @rest_search_model.alcohol
    fill_in "Friday", with: @rest_search_model.friday
    fill_in "Googlemap", with: @rest_search_model.googlemap
    fill_in "Homepage", with: @rest_search_model.homepage
    fill_in "Mask", with: @rest_search_model.mask
    fill_in "Monday", with: @rest_search_model.monday
    fill_in "Name", with: @rest_search_model.name
    fill_in "Saturday", with: @rest_search_model.saturday
    fill_in "Sunday", with: @rest_search_model.sunday
    fill_in "Tabelog", with: @rest_search_model.tabelog
    fill_in "Takeout", with: @rest_search_model.takeout
    fill_in "Temp", with: @rest_search_model.temp
    fill_in "Thursday", with: @rest_search_model.thursday
    fill_in "Tuesday", with: @rest_search_model.tuesday
    fill_in "Wednesday", with: @rest_search_model.wednesday
    click_on "Update Rest search model"

    assert_text "Rest search model was successfully updated"
    click_on "Back"
  end

  test "destroying a Rest search model" do
    visit rest_search_models_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Rest search model was successfully destroyed"
  end
end
