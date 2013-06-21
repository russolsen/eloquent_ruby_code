require '../utils/rspec_utils'

describe 'the literal examples in the book' do

  it 'should have a good example of regular and percent w array lits' do

    poem_words = [ 'twinkle', 'little', 'star', 'how', 'I', 'wonder' ]  ##+traditional

    old = poem_words

    poem_words = %w{ twinkle little star how I wonder }          ##+percent_w

    old.should == poem_words
  end

  it 'should have a good example of old and new style hash lits' do

    freq = { "I" => 1, "don't" => 1, "like" => 1, "spam" => 963 }  ##+string_keys

    book_info = { :first_name => 'Russ', :last_name => 'Olsen' }   ##+sym_keys

    old = book_info

    book_info = { first_name: 'Russ', last_name: 'Olsen' }         ##+quick_hash_keys

    old.should == book_info
  end
end
