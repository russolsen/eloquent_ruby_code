require 'word_processor'

describe WordProcessor do

  it "should have a Font class" do
    WordProcessor.should be_an_instance_of( Module )
    WordProcessor::Rendering.should be_an_instance_of( Module )
    WordProcessor::Rendering::Font.should be_an_instance_of( Class )
  end

end
