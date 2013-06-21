
require '../code/simple_doc'

class Doc                      ##(cryptic
  attr_accessor :ttl, :au, :c 

  def initialize(ttl, au, c) 
    @ttl = ttl; @au = au; @c = c 
  end 

  def wds;  @c.split; end 
end                           ##cryptic)

describe Doc do
  before :each do
    @doc = Doc.new( 'Title', 'Russ', 'hello world' )
  end

  it 'should keep the title author and content' do
    @doc.ttl.should == 'Title'
    @doc.au.should == 'Russ'
    @doc.c.should == 'hello world'
  end

  it 'should return the words in the doc' do
    @doc.wds[0].should == 'hello'
    @doc.wds[1].should == 'world'
  end

end
