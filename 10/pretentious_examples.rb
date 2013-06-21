

describe 'Pretentions ratings' do
  it 'should return the right rating' do
    doc = Document.new( 1.0,  0.1   ).prose_rating.should == :really_pretentious
    doc = Document.new( 1.0,  0.199 ).prose_rating.should == :really_pretentious
    doc = Document.new( 1.0,  0.3   ).prose_rating.should == :somewhat_pretentious
    doc = Document.new( 1.0,  0.4   ).prose_rating.should == :somewhat_pretentious

    doc = Document.new( 0.2,  0.1   ).prose_rating.should == :about_right
    doc = Document.new( 0.2,  0.199 ).prose_rating.should == :about_right
    doc = Document.new( 0.19, 0.9   ).prose_rating.should == :about_right

    doc = Document.new( 0.0,  0.4   ).prose_rating.should == :really_informal
    doc = Document.new( 0.05, 0.29  ).prose_rating.should == :somewhat_informal
  end

end
