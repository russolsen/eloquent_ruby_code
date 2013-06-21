require '../utils/rspec_utils'
require '../code/doc3'


require 'text'  # From the text gem  ##(main

class Document
  include Text
 
    # Most of the class omitted...

  def method_missing( missing, *args )
    candidates = methods_that_sound_like( missing.to_s )

    message = "You called an undefined method: #{missing}."

    unless candidates.empty?
      message += "\nDid you mean #{candidates.join(' or ')}?"
    end
    raise raise NoMethodError.new( message )
  end

  def methods_that_sound_like( name )
    missing_soundex = Soundex.soundex( name.to_s )
    public_methods.sort.find_all do |existing|
      existing_soundex = Soundex.soundex( existing.to_s )
      missing_soundex == existing_soundex
    end
  end
end                                ##main)

describe Document do

  before :each do
    @doc = Document.new('Titanic', 'Cameron', 'Sail, crash, sink')
  end

  it 'should work the same for completely off the wall methods' do
    begin
      @doc.foobar
    rescue
      $!.message.should match( /.*You called an undefined method: foobar/m )
    end
  end

  it 'should guess at near misses' do
    begin
      @doc.contnt
    rescue
      $!.message.should match( /.*You called an undefined method: contnt.*mean content/m )
      File.write( 'guess.txt', $!.message )
    end
  end

end
