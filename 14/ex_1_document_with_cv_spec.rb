
require 'document_with_cv'

describe Document do

  it 'should start with a default paper size' do
    Document.default_paper_size.should == :a4
    Document.default_paper_size = :us_letter
    Document.default_paper_size.should == :us_letter
  end

end
