require '../code/document.rb'
require '../utils/rspec_utils'

class Document                      ##(main
  # Most of the class omitted

  private  # Methods are private starting here

  def word_count
    return words.size
  end
end                                ##main)

describe 'chapter' do
  it 'should have a good default private example' do
    Document.private_instance_methods.should include(:word_count)
  end
end
