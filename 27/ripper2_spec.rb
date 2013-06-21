require '../utils/rspec_utils'

describe "second ripper scripts" do

  it 'fix title example should work' do
    out = `ruby -I . ripper2_demo.rb`
    out.should match( /author>J.R.R. Tolkien/ )
  end

end



