require 'test_helper'

class ProductTest < ActiveSupport::TestCase
    test "should not save product without name" do
      product = Product.new(price: 20, quantity: 5)
      assert_not product.save, "Saved the product without a name"
    end
  
    test "should not save product with negative price" do
      product = Product.new(name: "Example Product", price: -10, quantity: 5)
      assert_not product.save, "Saved the product with a negative price"
    end
  
    test "should save valid product" do
      product = Product.new(name: "Example Product", price: 20, quantity: 5)
      assert product.save, "Could not save a valid product"
    end
  end