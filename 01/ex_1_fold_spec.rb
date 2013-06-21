require '../utils/rspec_utils'

describe 'folding lines' do

  it 'should demo a one liner with braces' do
    out = output_of {
      10.times { |n| puts "The number is #{n}" } ##+brace
    }
    out.should match( /The number.*0.*1.*2.*9$/m )
  end

  it 'should demo the do end version' do
    out = output_of {
      10.times do |n|                   ##(do
        puts "The number is #{n}"
        puts "Twice the number is #{n*2}"
      end                               ##do)
    }
    out.should match( /The number.*0.*1.*2.*9$/m )
  end
end


