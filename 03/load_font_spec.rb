require '../code/doc3'

def load_font( specification_hash )                   ##(main
  # Load a font according to  specification_hash[:name] etc.
  specification_hash                                  ##--main
end                                                   ##main)

describe 'default hash behavior' do

  it 'should work like the example says' do
    result = (
      load_font( { :name => 'times roman', :size => 12 })  ##+paren_brace
    )
    result.should == { name: 'times roman', size: 12 }

    result = (
      load_font( :name => 'times roman', :size => 12 )     ##+paren
    )
    result.should == { name: 'times roman', size: 12 }

    result = (
      load_font :name => 'times roman', :size => 12  ##+nothing
    )
    result.should == { name: 'times roman', size: 12 }

  end

end
