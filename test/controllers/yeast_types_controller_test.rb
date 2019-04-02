require 'test_helper'

class YeastTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @yeast_type = yeast_types(:one)
  end

  test "should get index" do
    get yeast_types_url
    assert_response :success
  end

  test "should get new" do
    get new_yeast_type_url
    assert_response :success
  end

  test "should create yeast_type" do
    assert_difference('YeastType.count') do
      post yeast_types_url, params: { yeast_type: { alm: @yeast_type.alm, erl: @yeast_type.erl, gvh: @yeast_type.gvh, latitude: @yeast_type.latitude, localization_site: @yeast_type.localization_site, longitude: @yeast_type.longitude, mcg: @yeast_type.mcg, mit: @yeast_type.mit, nuc: @yeast_type.nuc, pox: @yeast_type.pox, sequence_name: @yeast_type.sequence_name, vac: @yeast_type.vac } }
    end

    assert_redirected_to yeast_type_url(YeastType.last)
  end

  test "should show yeast_type" do
    get yeast_type_url(@yeast_type)
    assert_response :success
  end

  test "should get edit" do
    get edit_yeast_type_url(@yeast_type)
    assert_response :success
  end

  test "should update yeast_type" do
    patch yeast_type_url(@yeast_type), params: { yeast_type: { alm: @yeast_type.alm, erl: @yeast_type.erl, gvh: @yeast_type.gvh, latitude: @yeast_type.latitude, localization_site: @yeast_type.localization_site, longitude: @yeast_type.longitude, mcg: @yeast_type.mcg, mit: @yeast_type.mit, nuc: @yeast_type.nuc, pox: @yeast_type.pox, sequence_name: @yeast_type.sequence_name, vac: @yeast_type.vac } }
    assert_redirected_to yeast_type_url(@yeast_type)
  end

  test "should destroy yeast_type" do
    assert_difference('YeastType.count', -1) do
      delete yeast_type_url(@yeast_type)
    end

    assert_redirected_to yeast_types_url
  end
end
