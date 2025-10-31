require "test_helper"

class ProductsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @product = products(:one)
  end

  test "should get index" do
    get products_url
    assert_response :success
  end

  test "should get new" do
    get new_product_url
    assert_response :success
  end

  test "should create product with valid params" do
    assert_difference("Product.count", 1) do
      post products_url, params: { product: { name: "New Product" } }
    end
    assert_redirected_to product_url(Product.last)
  end

  test "should not create product with invalid params" do
    assert_no_difference("Product.count") do
      post products_url, params: { product: { name: "" } }
    end
    assert_response :unprocessable_entity
  end

  test "should show product" do
    get product_url(@product)
    assert_response :success
  end

  test "should get edit" do
    get edit_product_url(@product)
    assert_response :success
  end

  test "should update product with valid params" do
    patch product_url(@product), params: { product: { name: "Updated Name" } }
    assert_redirected_to product_url(@product)
    @product.reload
    assert_equal "Updated Name", @product.name
  end

  test "should not update product with invalid params" do
    patch product_url(@product), params: { product: { name: "" } }
    assert_response :unprocessable_entity
    @product.reload
    refute_equal "", @product.name
  end

  test "should destroy product" do
    assert_difference("Product.count", -1) do
      delete product_url(@product)
    end
    assert_redirected_to products_url
  end
end
