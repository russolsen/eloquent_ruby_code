require '../code/doc3'
require '../utils/rspec_utils'

describe "running thru collection examples" do
  it "with index example should work" do
    words = %w{ Mary had a little lamb }          ##(with_index

    for i in 0..words.size
      puts words[i]
    end                                           ##with_index)
  end

  it "each example should work" do
    words = %w{ Mary had a little lamb }

    words.each { |word| puts word }           ##+with_each
  end


  it 'should have a good single arg hash each collection' do
    out = output_of {
      movie = { title: '2001', genre: 'sci fi', rating: 10 }    ##(hash_each

      movie.each { |entry| pp entry }                           ##hash_each)
    }
    File.write( "2001.txt", out )
  end

  it 'should have a good double arg hash each collection' do
    out = output_of {
      movie = { title: '2001', genre: 'sci fi', rating: 10 }

      movie.each { |name, value| puts "#{name} => #{value}"}    ##+hash_double
    }
  end

end
