require 'test_helper'

class VariantImagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @variant_image = variant_images(:one)
  end

  test "should get index" do
    get variant_images_url, as: :json
    assert_response :success
  end

  test "should create variant_image" do
    assert_difference('VariantImage.count') do
      post variant_images_url, params: { variant_image: { back_url: @variant_image.back_url, belongs_to: @variant_image.belongs_to, detail_url: @variant_image.detail_url, front_url: @variant_image.front_url, full_url: @variant_image.full_url, side_url: @variant_image.side_url } }, as: :json
    end

    assert_response 201
  end

  test "should show variant_image" do
    get variant_image_url(@variant_image), as: :json
    assert_response :success
  end

  test "should update variant_image" do
    patch variant_image_url(@variant_image), params: { variant_image: { back_url: @variant_image.back_url, belongs_to: @variant_image.belongs_to, detail_url: @variant_image.detail_url, front_url: @variant_image.front_url, full_url: @variant_image.full_url, side_url: @variant_image.side_url } }, as: :json
    assert_response 200
  end

  test "should destroy variant_image" do
    assert_difference('VariantImage.count', -1) do
      delete variant_image_url(@variant_image), as: :json
    end

    assert_response 204
  end
end
