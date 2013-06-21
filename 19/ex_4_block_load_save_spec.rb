
require '../code/doc3'
require '../utils/rspec_utils'

require 'doc_block_listeners'

describe Document do
  it 'should comment on what is going on' do
    my_doc = Document.new( 'Block Based Example', 'russ', '' )  ##(main

    my_doc.on_load do |doc|
      puts "Hey, I've been loaded!"
    end

    my_doc.on_save do |doc|
      puts "Hey, I've been saved!"
    end                                                               ##main)

    save_out = output_of { my_doc.save("example.txt") }
    load_out = output_of { my_doc.load("example.txt") }

    puts save_out
    puts load_out
    save_out.should match(/Hey.*saved/m)
    load_out.should match(/Hey.*loaded/m)
  end
end

    


