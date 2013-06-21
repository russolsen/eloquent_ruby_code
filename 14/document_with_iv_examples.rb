describe Document do

  it 'should start with a default paper size' do
    Document.default_font.should == :times
    Document.default_font = :dingbat
    Document.default_font.should == :dingbat
  end

  it 'should pass on the default font to the subclases' do
    d = Document.new( 'example', 'russ' )
    d.font.should == Document.default_font
  end
end
