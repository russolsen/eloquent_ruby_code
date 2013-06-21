require '../code/document.rb'
require '../utils/rspec_utils'

# RomanceNovel is a subclass of Document, ##(main
# which is a subclass of Object

class RomanceNovel < Document
  # Lot's of steamy stuff omitted...
end                               ##main)

describe 'chapter' do
  it 'should have a good about_me example' do
    doc = RomanceNovel.new( 'Ethics', 'Spinoza', 'By that which is...' )
  end
end
