require '../code/doc3'

class  Document                          ##(main

  CLICHES = [ /play fast and loose/,
              /make no mistake/,
              /does the trick/,
              /off and running/,
              /my way or the highway/ ]

  def number_of_cliches
     CLICHES.inject(0) do |count, phrase|
       count += 1 if phrase =~ content
       count
     end
  end

  # Rest of the class omitted...
end                                      ##main)

require 'prose_quality_examples'
