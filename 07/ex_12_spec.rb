require '../code/document.rb'
require '../utils/rspec_utils'

class Document                     ##(main
  # Most of the class omitted...

  # Send this document to off via email
  def send( recipient )
    # Do some interesting SMTP stuff...
    "my send"                      ##--main
  end
end                                 ##main)

describe 'chapter' do
  it 'should have a good override send example' do
    doc = Document.new( 'Ethics', 'Spinoza', 'By that which is' )
    doc.send('russ@russolsen.com').should == 'my send'
  end
end
