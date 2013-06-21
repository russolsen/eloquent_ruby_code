require '../code/doc3'
require 'electronic_text'
require 'writing_quality_mixin'

module ProjectManagement
  def proj_man
  end
end

module AuthorAccountTracking
  def author_account
  end
end

module ProjectManagement                        ##(more_mods
  # Lots of boring stuff omitted
end

module AuthorAccountTracking
  # Lots of even more boring stuff omitted
end

class  ElectronicBook < ElectronicText
  include WritingQuality 
  include ProjectManagement
  include AuthorAccountTracking

  # Lots of stuff omitted...
end                                             ##more_mods)

describe ElectronicBook do
  it 'should have all the methods from all the modules' do
    eb = ElectronicBook.new( 'test', 'russ', 'hello' )
    eb.number_of_cliches.should == 0
    lambda { eb.proj_man }.should_not raise_error
    lambda { eb.author_account }.should_not raise_error
  end
end

