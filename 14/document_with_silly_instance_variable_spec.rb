class Document                 ##(main
  attr_accessor :default_font 
end                            ##main)


describe Document do
  it 'should have a default font instance var' do
    doc = Document.new
    doc.default_font = 'foo'
    doc.default_font.should == 'foo'
  end
end
