require 'test_helper'

class ProductsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @product = products(:one)
  end

  test "should get index" do
    get products_url, as: :json
    assert_response :success
  end

  test "should create product" do
    assert_difference('Product.count') do
      post products_url, params: { product: { belongs_to: @product.belongs_to, brand: @product.brand, category_name: @product.category_name, coming_soon: @product.coming_soon, description: @product.description, description_of_deal: @product.description_of_deal, display_name: @product.display_name, free_shipping: @product.free_shipping, image_extension: @product.image_extension, item_code: @product.item_code, list_price: @product.list_price, on_sale: @product.on_sale, orig_product_id: @product.orig_product_id, product_share_link: @product.product_share_link, product_size_chart: @product.product_size_chart, shipping_fee: @product.shipping_fee, student_deal: @product.student_deal } }, as: :json
    end

    assert_response 201
  end

  test "should show product" do
    get product_url(@product), as: :json
    assert_response :success
  end

  test "should update product" do
    patch product_url(@product), params: { product: { belongs_to: @product.belongs_to, brand: @product.brand, category_name: @product.category_name, coming_soon: @product.coming_soon, description: @product.description, description_of_deal: @product.description_of_deal, display_name: @product.display_name, free_shipping: @product.free_shipping, image_extension: @product.image_extension, item_code: @product.item_code, list_price: @product.list_price, on_sale: @product.on_sale, orig_product_id: @product.orig_product_id, product_share_link: @product.product_share_link, product_size_chart: @product.product_size_chart, shipping_fee: @product.shipping_fee, student_deal: @product.student_deal } }, as: :json
    assert_response 200
  end

  test "should destroy product" do
    assert_difference('Product.count', -1) do
      delete product_url(@product), as: :json
    end

    assert_response 204
  end
end
