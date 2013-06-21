require 'test/unit'
require '../code/doc3'


class DocumentTest < Test::Unit::TestCase 

  def test_assert_match
    assert_match /times.*/, 'times new roman'  ##+match
  end 

  def test_instance_of
    assert_instance_of String, 'hello'   ##+instance
  end 

  def test_raise
    assert_raise ZeroDivisionError do      ##(with_raise
      x = 1/0
    end                                    ##with_raise)
  end 
 
  def test_no_raise
    assert_nothing_thrown do               ##(no_raise
      x = 1/2
    end                                    ##no_raise)
  end
 
end 
