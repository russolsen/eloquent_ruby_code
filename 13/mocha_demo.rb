require 'mocha'

include Mocha::API

class Document
end

mock_doc = Document.new
mock_doc.expects(:words).returns( %w{Call me Ishmael} )
mock_doc.expects(:word_count).returns( 3 )
p mock_doc.singleton_methods
