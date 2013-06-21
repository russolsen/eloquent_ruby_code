require '../code/doc3'

class Document          ##(main
  # Lots of stuff omitted... 

  if RUBY_VERSION >= '1.9' 
    def char_at( index ) 
      @content[ index ] 
    end 
  else 
    def char_at( index ) 
      @content[ index ].chr 
    end 
  end 
end                    ##main)

describe Document do
  it 'should have a working char_at method' do
    d = Document.new( '', '', 'abcde' )
    d.char_at(0).should == 'a'
    d.char_at(1).should == 'b'
    d.char_at(2).should == 'c'
    d.char_at(3).should == 'd'
    d.char_at(4).should == 'e'
  end
end


