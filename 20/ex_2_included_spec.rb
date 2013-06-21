require '../utils/rspec_utils'

module WritingQuality                    ##(wq
  def self.included(klass) 
    puts "Hey, I've been included in #{klass}" 
  end 

  def number_of_cliches
    # Body of method omitted...
  end
end                                      ##wq)

class Dummy
  public_class_method :include
end

describe WritingQuality do
  it 'should squak when you include it' do
    out = output_of { Dummy.include(WritingQuality) }
    out.should match( /Hey/ )
  end
end
