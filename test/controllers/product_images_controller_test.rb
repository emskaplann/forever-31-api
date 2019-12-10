require 'test_helper'

class ProductImagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @product_image = product_images(:one)
  end

  test "should get index" do
    get product_images_url, as: :json
    assert_response :success
  end

  test "should create product_image" do
    assert_difference('ProductImage.count') do
      post product_images_url, params: { product_image: { back_url: @product_image.back_url, belongs_to: @product_image.belongs_to, detail_url: @product_image.detail_url, front_url: @product_image.front_url, full_url: @product_image.full_url, side_url: @product_image.side_url } }, as: :json
    end

    assert_response 201
  end

  test "should show product_image" do
    get product_image_url(@product_image), as: :json
    assert_response :success
  end

  test "should update product_image" do
    patch product_image_url(@product_image), params: { product_image: { back_url: @product_image.back_url, belongs_to: @product_image.belongs_to, detail_url: @product_image.detail_url, front_url: @product_image.front_url, full_url: @product_image.full_url, side_url: @product_image.side_url } }, as: :json
    assert_response 200
  end

  test "should destroy product_image" do
    assert_difference('ProductImage.count', -1) do
      delete product_image_url(@product_image), as: :json
    end

    assert_response 204
  end
end
