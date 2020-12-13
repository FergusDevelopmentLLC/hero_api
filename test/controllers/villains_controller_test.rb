require 'test_helper'

class VillainsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @villain = villains(:one)
  end

  test "should get index" do
    get villains_url, as: :json
    assert_response :success
  end

  test "should create villain" do
    assert_difference('Villain.count') do
      post villains_url, params: { villain: { hero_id: @villain.hero_id, name: @villain.name } }, as: :json
    end

    assert_response 201
  end

  test "should show villain" do
    get villain_url(@villain), as: :json
    assert_response :success
  end

  test "should update villain" do
    patch villain_url(@villain), params: { villain: { hero_id: @villain.hero_id, name: @villain.name } }, as: :json
    assert_response 200
  end

  test "should destroy villain" do
    assert_difference('Villain.count', -1) do
      delete villain_url(@villain), as: :json
    end

    assert_response 204
  end
end
