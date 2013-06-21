require 'doc_block_listeners'

describe Document do
  it "should know how many words it contains" do              ##(main
    doc = Document.new('example', 'russ', 'hello world')
    doc.word_count.should == 2
  end                                                         ##main)
end
