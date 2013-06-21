require '../utils/rspec_utils'

describe "String examples" do

  it 'should work with single quotes' do
    a_string_with_a_quote = 'Say it ain\'t so!'  ##+single_quote
    a_string_with_a_quote.should match(/Say.*'/)
  end

  it 'should let you add a literal backslash' do
    a_string_with_a_backslash = 'This is a backslash: \\' ##+back_slash
    a_string_with_a_backslash.should match( /This.*\\/)
  end

  it 'should let double quoted strings have tabs and newlines' do
    double_quoted = "I have a tab: \t and a newline: \n"  ##+double_quoted
    double_quoted.should match( /I have.*\t.*\n/m )
  end

  it "should print the right thing" do
    out = output_of {
      author = "Ben Bova"                            ##(interp
      title = "Mars"
      puts "#{title} is written by #{author}"        ##interp)
    }

    out.should match( /Mars is.*Bova/ )

    File.write( "mars.txt", out )
  end

  it "should let you reverse your quotes" do

    good =
    str = %q{"Stop", she said, "I cannot deal with the backslashes."} ##+reverse1


    str = "\"Stop\", she said, \"I cannot deal with the backslashes.\"" ##+reverse2
    str.should == good

    str = '"Stop", she said, "I cannot deal with the backslashes."'   ##+single_q
    str.should == good

    good = 
    str = %q{"Stop", she said, "I can't live without 's and "s."}   ##+percent_q

    str = '"Stop", she said, "I can\'t live without \'s and "s."'   ##+single_bs
    str.should == good

    str = %q{"Stop", she said, "I can't live without 's and "s."}
    str.should == good

    str = %q("Stop", she said, "I can't live without 's and "s.")  ##+percent_paren
    str.should == good

    str = %q<"Stop", she said, "I can't live without 's and "s.">  ##+percent_less_than
    str.should == good

    str = %q$"Stop", she said, "I can't live without 's and "s."$  ##+percent_dollar
    str.should == good

  end

  it "should be a iterpolation example" do
    str = %Q<The time in now #{Time.now}>          ##+percent_big_q
  end


  it "should be a good multiline string" do
  a_multiline_string = "a multi-line
string"
  a_multiline_string.index("\n").should_not == nil

  another_one = %q{another multi-line
string}
  another_one.index("\n").should_not == nil

  another_one = %Q{another multi-line string with\
no newline}
  another_one.index("\n").should == nil
  end

  it "should be a good here doc" do
heres_one = <<EOF
This is the beginning of my here document.
And this is the end.
EOF
    heres_one.should match /This is the/
    heres_one.should match /is the end/
  end


  it "should chomp off newline" do
  str = \
 "It was a dark and stormy night\n".chomp    ##+with_chomp
  str.should == "It was a dark and stormy night"

  str = \
 "hello\n\n\n".chomp 
  str.should == "hello\n\n"

  end

  it "should be syntacially correct example" do
  'It is warm outside'.sub( 'warm', 'cold' )   ##+with_sub

    out = output_of {
      puts 'yes yes'.sub( 'yes', 'no' )        ##(sub_gsub
      puts  'yes yes'.gsub( 'yes', 'no' )      ##sub_gsub)
    }
    out.should match( /no yes.*no no/m )
    File.write( 'sub.txt', out )
  end

  it "should be a good example of split" do
  a = \
  'It was a dark and stormy night'.split      ##+with_split

  a.should == \
     ["It", "was", "a", "dark", "and", "stormy", "night"] ##+split_result
  end


  it "should be another good example of split" do
  a = \
  'Bill:Shakespeare:Playwright:Globe'.split( ':' )   ##+bill_split
  a.should == \
  ["Bill", "Shakespeare", "Playwright", "Globe"]     ##+bill_result
  end


  it "should demo split! correctly" do
    title = 'It was a dark and stormy night'   ##(sub_bang
    title.sub!( 'dark', 'bright' )
    title.sub!( 'stormy', 'clear' )            ##sub_bang)
    title.should == 
      'It was a bright and clear night'        ##+sub_bang_result
  end

  it "should demo index correctly" do
    i = \
    "It was a dark and stormy night".index( "dark" )  # Returns 9  ##+with_index
    i.should == 9
  end

  
  it "should be synt correct each_char example" do
    @author = "Clarke"

    out = output_of {
      @author.each_char {|c| puts c}                 ##+loop_clarke
    }
    out.should match( /C\nl\na\n/m )
    File.write( 'clarke.txt', out )
  end

  it "should be synt correct each_byte example" do
    @author = "Clarke"
    out = output_of {
      @author.each_byte { |b| puts b }                 ##+loop_bytes
    }
    out.should match( /67\n108\n97\n/m )
    File.write( 'bytes.txt', out )
  end

  it 'should show that you can loop thru lines' do
    @content = "aaa\nbbb\nccc\n"

    out = output_of {
      @content.each_line { |line| puts line }            ##+loop_lines
    }

    out.should match(/aaa.bbb.ccc\n/m)
  end

  it "should show that strings are mutable" do

    first_name = 'Karen'       ##(mutable_name
    given_name = first_name    ##mutable_name)

    first_name[0] = 'D'    ##+change_both

    first_name[0].should == 'D'
    given_name[0].should == 'D'

    first_name = 'Karen' 
    given_name = first_name

    first_name = first_name.upcase ##+change_assign

    first_name.should == 'KAREN'
    given_name.should == 'Karen'

    first_name = 'Karen' 
    given_name = first_name

    first_name.upcase!    ##+change_bang

    first_name.should == 'KAREN'
    given_name.should == 'KAREN'
  end

  it 'should have a good example of neg indexes' do
    first_name = 'Karen'
    (
      first_name[first_name.size - 1]    ##+long_last
    ).should == 'n'

    (
      first_name[-1]                       ##+short_last
    ).should == 'n'

    "abcde"[3..4].should == 'de'
  end

end
