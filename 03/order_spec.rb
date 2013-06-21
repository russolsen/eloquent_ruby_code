require '../utils/rspec_utils'

describe 'the ordered hash examples in the book' do

  it 'should have a good example of how hashes are ordered' do
    hey_its_ordered = { first: 'mama', second: 'papa', third: 'baby' }   ##+hey_order

    out = output_of {
      hey_its_ordered.each { |entry| pp entry }   ##+then_iterate
    }

    out.should match( /first.*second.*third/m )
    File.write( 'order.txt', out )

    hey_its_ordered[:fourth] = 'grandma'          ##+add_grandma

    out = output_of { pp hey_its_ordered }
    out.should match( /first.*second.*third.*fourth/m )

    hey_its_ordered[:first] = 'mom'

    out = output_of { pp hey_its_ordered }
    out.should match( /first.*second.*third.*fourth/m )
  end
end
