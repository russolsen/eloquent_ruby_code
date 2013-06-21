require '../utils/rspec_utils'

describe "first ripper scripts" do

  it 'author example should work' do
    out = `ruby -I . ripper1_title_author.rb`
    out.should == "J. R. R. Tolken\nA Long Expected Party\nA Shadow Of The Past\n"
  end


  it 'fix misspelling example should work' do
    out = `ruby -I . ripper1_fix_author.rb`
    out.should match( /author>J.R.R. Tolkien/ )
  end
end



