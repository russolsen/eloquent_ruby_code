require "../code/doc4"

class SuperSecretDocument                ##(main
  def initialize(original_document, time_limit_seconds)
    @original_document = original_document
    @time_limit_seconds = time_limit_seconds
    @create_time = Time.now
  end

  def time_expired?
    Time.now - @create_time >= @time_limit_seconds
  end

  def check_for_expiration
    raise 'Document no longer available' if time_expired?
  end

  def content
    check_for_expiration
    return @original_document.content
  end

  def title
    check_for_expiration
    return @original_document.title
  end

  def author
    check_for_expiration
    return @original_document.author
  end

  # and so on...
end                                      ##main)

describe "initile ss document example" do
  it "should have a working initial example" do
    doc = Document.new( 'plans', 'cia', 'We attack at dawn' )
    self.should_receive(:get_instructions).and_return(doc)

    original_instructions = get_instructions                       ##(example
    instructions = SuperSecretDocument.new(original_instructions, 5)   ##example)

    instructions.title.should == doc.title
    instructions.author.should == doc.author
    instructions.content.should == doc.content

    sleep(5.1)
    lambda { instructions.title }.should raise_error
    lambda { instructions.author }.should raise_error
    lambda { instructions.content }.should raise_error

  end
end
