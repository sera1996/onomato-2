require 'test_helper'

class OnomatopoeiaControllerTest < ActionDispatch::IntegrationTest
  setup do
    @onomatopoeium = onomatopoeia(:one)
  end

  test "should get index" do
    get onomatopoeia_url
    assert_response :success
  end

  test "should get new" do
    get new_onomatopoeium_url
    assert_response :success
  end

  test "should create onomatopoeium" do
    assert_difference('Onomatopoeium.count') do
      post onomatopoeia_url, params: { onomatopoeium: { name: @onomatopoeium.name } }
    end

    assert_redirected_to onomatopoeium_url(Onomatopoeium.last)
  end

  test "should show onomatopoeium" do
    get onomatopoeium_url(@onomatopoeium)
    assert_response :success
  end

  test "should get edit" do
    get edit_onomatopoeium_url(@onomatopoeium)
    assert_response :success
  end

  test "should update onomatopoeium" do
    patch onomatopoeium_url(@onomatopoeium), params: { onomatopoeium: { name: @onomatopoeium.name } }
    assert_redirected_to onomatopoeium_url(@onomatopoeium)
  end

  test "should destroy onomatopoeium" do
    assert_difference('Onomatopoeium.count', -1) do
      delete onomatopoeium_url(@onomatopoeium)
    end

    assert_redirected_to onomatopoeia_url
  end
end
