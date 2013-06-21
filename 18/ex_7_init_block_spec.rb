require '../code/doc3'

class Document                            ##(main
  attr_accessor :title, :author, :content 

  def initialize(title, author, content = '') 
    @title = title 
    @author = author 
    @content = content
    yield( self ) if block_given? 
  end 

  # Rest of the class omitted...
end                                       ##main)


describe Document do
  it 'should still not take a block' do
    d = Document.new( 'test', 'russ', 'something' )
    d.title.should == 'test'
    d.author.should == 'russ'
    d.content.should == 'something'
  end

  it 'should  take a block' do
    new_doc = Document.new( 'US Constitution', 'Madison', '' ) do |d| ##(const
      d.content << 'We the people'
      d.content << 'In order to form a more perfect union'
      d.content << 'provide for the common defense'
    end                                                                 ##const)

    new_doc.title.should == 'US Constitution'
    new_doc.author.should == 'Madison'
    new_doc.content.should match( /^We.*In order.*defense$/m )
  end
end
