require 'common'
require 'ez_ripper2.rb'
require 'bad_examples'
require 'good_examples'

describe EzRipper do
  it_should_behave_like "it handles correct ezr programs"
  it_should_behave_like "it has decent error handling"
end

