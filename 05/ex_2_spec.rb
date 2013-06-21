require '../utils/rspec_utils'
require '../code/doc3'

class Document                                   ##(obscure
  # Most of the class omitted...

  def obscure_times!
    @content.gsub!( /\d\d:\d\d (AM|PM)/, '**:** **' )
  end
end                                              ##obscure)


describe 'regular epression examples' do
  it 'should have a good initial example' do
    out = output_of {
      puts /\d\d:\d\d (AM|PM)/ =~ '10:24 PM'   ##+first_date
    }
    out.should match( /0/ )
    File.write( "first_date.txt", out )
  end

  it 'should have example of scanning' do
    out = output_of {
      puts /PM/ =~ '10:24 PM'           ##+scanning
    }
    out.should match( /6/ )
    File.write( "scanning.txt", out )
  end

  it 'should have example of a failed match' do
    (
      /May/ =~ 'Sometime in June'  ##+failed
    ).should == nil
  end

  it 'should have example matches as booleans' do
    out = output_of {
      the_time = '10:24 AM'                        ##(as_boolean
      puts "It's morning!" if /AM/ =~ the_time     ##as_boolean)
    }
    out.should match( /morning/ )
  end

  it 'should have match either way' do
    out = output_of {
      the_time = '10:24 AM'
      puts "It's morning!" if '10:24 AM' =~ /AM/  ##+either_way
    }
    out.should match( /morning/ )
  end
  
  it 'should let you turn off case sens' do
    out = output_of {
      puts "It matches!" if /AM/i =~ 'am'    ##+no_case
    }
    out.should match( /matches/ )
  end
  
  it 'should have a working example of obscuring times' do
    text = 'first 10:15 AM second 01:25 PM done'
    doc = Document.new( '', '', text )
    doc.obscure_times!
    doc.content.should match( /first \*\*:\*\* \*\* second \*\*:\*\* \*\*/ )
  end

  it 'should correctly explain the anchors' do
    start_re = 
      /\AOnce upon a time/     ##+backslash_a

    'Once upon a time a little boy'.should match(start_re)
    'Hey Once upon a time a little boy'.should_not match(start_re)

    end_re =
     /and they all lived happily ever after\z/  ##+backslash_z

    'blah balh and they all lived happily ever after'.should match(end_re)

content = 'The Princess And The Monkey

Once upon a time there was a princess...
...and they all lived happily ever after.

The End'

    content.should_not match( start_re)
    content.should_not match( end_re)

    out = output_of {
      puts "Found it" if content =~ /^Once upon a time/  ##+hat_match
    }
    out.should match(/Found/)

    out = output_of {
      puts "Found it" if content =~ /happily ever after\.$/  ##+dollar_match
    }
    out.should match(/Found/)

    content.should_not match( 
      /^Once upon a time.*happily ever after\.$/          ##+without_m
    )

    content.should match( 
      /^Once upon a time.*happily ever after\.$/m          ##+dot_and_dollar
    )
  end

  it 'should have good staying out of trouble examples' do
    out = output_of {
      puts /abc*/ == "abccccc"           ##+not_equals
    }
    out.should match( /false/ )


    out = output_of {
      puts /abc*/ =~ "abccccc"           ##+is_tilde
    }
    out.should match( /0/ )
  end

end
