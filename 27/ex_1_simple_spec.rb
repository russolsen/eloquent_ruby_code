require '../utils/rspec_utils'

describe "simple script examples" do

  it 'author example should work' do
    out = `ruby ex_1_author.rb`
    out.should == "J. R. R. Tolken\n"
  end


  it 'title example should work' do
    out = `ruby ex_1_title.rb`
    out.should == "A Long Expected Party\nA Shadow Of The Past\n"
  end

  it 'fix misspelling example should work' do
    out = `ruby ex_1_fix.rb`
    out.should match( /author>J.R.R. Tolkien/ )
  end
end



