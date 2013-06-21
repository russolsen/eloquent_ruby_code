
describe 'xmlripper4' do

  it 'should work with the commented version' do
    out = `ruby -I . ripper4_main.rb  on_doc_author.ripper fellowship.xml`
    out.should == "J. R. R. Tolken\n"
  end
end
