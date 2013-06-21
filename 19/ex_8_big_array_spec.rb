require 'doc_block_listeners'

def some_method(doc)                       ##(main
  big_array = Array.new(10000000)

  # Do something with big_array...

  doc.on_load do |d|
    puts "Hey, I've been loaded!"
  end
end                                       ##main)

describe 'some_method' do
  it 'should just work' do
    doc = Document.new( 'Block Based Example', 'russ', '' )
    some_method(doc)
  end
end
