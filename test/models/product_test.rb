require "test_helper"

class ProductTest < ActiveSupport::TestCase
  test "creating" do
    product = Product.new
    assert_not product.save

    product.name = "Some Shiny Thing"
    assert_not product.save

    product.price = 100.00
    assert product.save
  end
end
