require '../code/doc3'

require 'electronic_text'

module WritingQuality                         ##(wq_mod

  CLICHES = [ /play fast and loose/,
              /make no mistake/,
              /does the trick/,
              /off and running/,
              /my way or the highway/ ]
  
  def self.number_of_cliches(content)
    CLICHES.inject(0) do |count, phrase|
      count += 1 if phrase =~ content
      count
    end
  end
end                                           ##wq_mod)

class Document                                ##(wq_classes
  # Lots of stuff omitted...

  def number_of_cliches
    WritingQuality.number_of_cliches(content)
  end
end


class ElectronicBook < ElectronicText

  # Lots of stuff omitted...

  def number_of_cliches
     WritingQuality.number_of_cliches(content)
  end
end                                         ##wq_classes)

require 'prose_quality_examples'

describe ElectronicBook do
  it 'should measure prose quality ok' do
    content = 'does the trick my way or the highway off and running'
    et = ElectronicBook.new( 'test', 'russ', content )
    et.number_of_cliches.should == 3
  end
end





