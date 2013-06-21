require '../code/doc3'

class Document                         ##(main

  # Most of the class omitted...

  def add_authors( *names )
    @author += " #{names.join(' ')}"
  end
end                                   ##main)


describe Document do

  it 'should work like the example says' do
    doc = Document.new( '', 'russ', '' )
    doc.add_authors( 'Strunk', 'White' )   ##+add
    doc.author.should == 'russ Strunk White'
  end

end
