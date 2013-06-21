require "../code/doc3"

class Document
  attr_accessor :revision_date, :page_layout, :page_size
end

class SuperSecretDocument
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
end

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

  # content, title and author methods omitted
  # to keep from kill even more trees...

  # And some new methods....

  def revision_date
    check_for_expiration
    return @original_document.revision_date
  end

  def page_layout
    check_for_expiration
    return @original_document.page_layout
  end

  def page_size
    check_for_expiration
    return @original_document.page_size
  end

  # And so on and so on and so on...
end                                      ##main)

describe SuperSecretDocument do
  it 'should have a working extended ss document' do
    doc = Document.new( 'The Plans', 'Russ', 'We attack at dawn' )
    doc.page_layout = :landscape
    doc.page_size = :A4
    doc.revision_date = :yesterday

    sdoc =  SuperSecretDocument.new( doc, 1 )
    sdoc.content.should == 'We attack at dawn'
    sdoc.page_layout.should == :landscape
    sdoc.page_size.should == :A4
    sdoc.revision_date.should == :yesterday
  end
end
