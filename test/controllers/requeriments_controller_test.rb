require 'test_helper'

class RequerimentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @requeriment = requeriments(:one)
  end

  test "should get index" do
    get requeriments_url, as: :json
    assert_response :success
  end

  test "should create requeriment" do
    assert_difference('Requeriment.count') do
      post requeriments_url, params: { requeriment: { content: @requeriment.content, title: @requeriment.title, user: @requeriment.user } }, as: :json
    end

    assert_response 201
  end

  test "should show requeriment" do
    get requeriment_url(@requeriment), as: :json
    assert_response :success
  end

  test "should update requeriment" do
    patch requeriment_url(@requeriment), params: { requeriment: { content: @requeriment.content, title: @requeriment.title, user: @requeriment.user } }, as: :json
    assert_response 200
  end

  test "should destroy requeriment" do
    assert_difference('Requeriment.count', -1) do
      delete requeriment_url(@requeriment), as: :json
    end

    assert_response 204
  end
end
