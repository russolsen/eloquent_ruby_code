require '../code/doc4'
require '../utils/rspec_utils'

class SuperSecretDocument < BasicObject                     ##(main
  # Most of the class omitted...
  def initialize(original_document, time_limit_seconds)
    @original_document = original_document
    @time_limit_seconds = time_limit_seconds
    @create_time = ::Time.now
  end

  def time_expired?
    ::Time.now - @create_time >= @time_limit_seconds
  end

  def check_for_expiration
    raise 'Document no longer available' if time_expired?
  end

  def method_missing(name, *args)
    check_for_expiration
    @original_document.send(name, *args)
  end
end                                                         ##main)

describe 'pickier supersecret document' do
  it "should have a good specific method delegation" do
    doc = Document.new( 'The Plans', 'Russ', 'We attack at dawn' )
    sdoc =  SuperSecretDocument.new( doc, 1 )
    sdoc.content.should == 'We attack at dawn'
    sdoc.words.should == %w{We attack at dawn}
    sleep( 1.2 )
    lambda{ sdoc.title }.should raise_error
  end

  it 'should work with to_s' do
     doc = Document.new( 'The Plans', 'Russ', 'We attack at dawn' )
     pdoc = SuperSecretDocument.new(doc, 2)
     pdoc.title.should == 'The Plans'
     pdoc.author.should == 'Russ'
     pdoc.content.should match(/We a/)
     pdoc.to_s.should match(/<Document/)
  end
end
