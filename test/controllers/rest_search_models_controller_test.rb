require 'test_helper'

class RestSearchModelsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @rest_search_model = rest_search_models(:one)
  end

  test "should get index" do
    get rest_search_models_url
    assert_response :success
  end

  test "should get new" do
    get new_rest_search_model_url
    assert_response :success
  end

  test "should create rest_search_model" do
    assert_difference('RestSearchModel.count') do
      post rest_search_models_url, params: { rest_search_model: { alcohol: @rest_search_model.alcohol, friday: @rest_search_model.friday, googlemap: @rest_search_model.googlemap, homepage: @rest_search_model.homepage, mask: @rest_search_model.mask, monday: @rest_search_model.monday, name: @rest_search_model.name, saturday: @rest_search_model.saturday, sunday: @rest_search_model.sunday, tabelog: @rest_search_model.tabelog, takeout: @rest_search_model.takeout, temp: @rest_search_model.temp, thursday: @rest_search_model.thursday, tuesday: @rest_search_model.tuesday, wednesday: @rest_search_model.wednesday } }
    end

    assert_redirected_to rest_search_model_url(RestSearchModel.last)
  end

  test "should show rest_search_model" do
    get rest_search_model_url(@rest_search_model)
    assert_response :success
  end

  test "should get edit" do
    get edit_rest_search_model_url(@rest_search_model)
    assert_response :success
  end

  test "should update rest_search_model" do
    patch rest_search_model_url(@rest_search_model), params: { rest_search_model: { alcohol: @rest_search_model.alcohol, friday: @rest_search_model.friday, googlemap: @rest_search_model.googlemap, homepage: @rest_search_model.homepage, mask: @rest_search_model.mask, monday: @rest_search_model.monday, name: @rest_search_model.name, saturday: @rest_search_model.saturday, sunday: @rest_search_model.sunday, tabelog: @rest_search_model.tabelog, takeout: @rest_search_model.takeout, temp: @rest_search_model.temp, thursday: @rest_search_model.thursday, tuesday: @rest_search_model.tuesday, wednesday: @rest_search_model.wednesday } }
    assert_redirected_to rest_search_model_url(@rest_search_model)
  end

  test "should destroy rest_search_model" do
    assert_difference('RestSearchModel.count', -1) do
      delete rest_search_model_url(@rest_search_model)
    end

    assert_redirected_to rest_search_models_url
  end
end
