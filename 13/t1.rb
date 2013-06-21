require 'test/unit'
require 'mocha'

class Product
  def self.find(n)
  end
end

class MiscExampleTest < Test::Unit::TestCase
  
  def test_mocking_a_class_method
    product = Product.new
    Product.expects(:find).with(1).returns(product)
    #assert_equal product, Product.find(1)
  end
end
