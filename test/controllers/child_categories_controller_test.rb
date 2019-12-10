require 'test_helper'

class ChildCategoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @child_category = child_categories(:one)
  end

  test "should get index" do
    get child_categories_url, as: :json
    assert_response :success
  end

  test "should create child_category" do
    assert_difference('ChildCategory.count') do
      post child_categories_url, params: { child_category: { category_id: @child_category.category_id, gender: @child_category.gender, image_path: @child_category.image_path, name: @child_category.name } }, as: :json
    end

    assert_response 201
  end

  test "should show child_category" do
    get child_category_url(@child_category), as: :json
    assert_response :success
  end

  test "should update child_category" do
    patch child_category_url(@child_category), params: { child_category: { category_id: @child_category.category_id, gender: @child_category.gender, image_path: @child_category.image_path, name: @child_category.name } }, as: :json
    assert_response 200
  end

  test "should destroy child_category" do
    assert_difference('ChildCategory.count', -1) do
      delete child_category_url(@child_category), as: :json
    end

    assert_response 204
  end
end
