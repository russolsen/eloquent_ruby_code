describe 'a bad test' do

  before :each do
    @message = 'error error error'
  end

  # This test should was meant to fail, but doesn't

  it 'should not have an error message' do
    found_error = @message =~ /error/
    found_error.should_not == true
  end
end
