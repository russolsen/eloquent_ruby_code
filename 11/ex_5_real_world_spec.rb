
describe Time do
  it 'should work the way the book says' do
    now = Time.now                     ##+make_now
    one_minute_from_now = now + 60     ##+time_plus_int

    lambda {
      one_minute_from_now = 60 + now  # Bang!  ##+int_plus_time
    }.should raise_error
  end
end

describe 'format' do
  it 'should have a simple example' do
    (
      "The value of n is %d" % 42               ##+format_42
    ).should == 'The value of n is 42' 
  end

  it 'should work' do
    day = 4                             ##(day_month_year
    month = 7
    year = 1776                         ##day_month_year)

    file_name = 'file_%02d%02d%d' % [ day, month, year ]   ##+file_name
    file_name.should == 'file_04071776'

    file_name = sprintf( 'file_%02d%02d%d' , day, month, year )
    file_name.should == 'file_04071776'
  end
end

describe 'rspec expectations' do
  it 'should work like the book says' do
    x = 42
    x.should == 42               ##+rspec
  end
end
