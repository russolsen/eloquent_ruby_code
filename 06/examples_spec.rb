require '../utils/rspec_utils'
require 'pp'

describe "Symbol examples" do

  it "should have a good identify example" do
 
    a = :all       ##(same
    b = a
    c = :all       ##same)

    # True! All true!    ##(identical

    a == c
    a === c
    a.eql?(c)
    a.equal?(c)           ##identical)

    (a == c).should == true
    (a === c).should == true
    (a.eql?(c)).should == true
    (a.equal?(c)).should == true

  end


  it "should contrast with the strings" do

    x = "all"                     ##(strings
    y = "all"                     ##strings)

    (x == y).should == true
    (x === y).should == true
    (x.eql?(y)).should == true
    (x.equal?(y)).should == false
  end

  it "should show strings are mutable" do
    author = "jules verne"                                ##(verne
    author.upcase!           # Now author is JULES VERNE  ##verne)

    author.should == "JULES VERNE"
  
    author = "jules verne"    ##(verne_writer
    writer = author           ##verne_writer)

    author.upcase!            ##+verne_up

    author.should == writer
    writer.should == "JULES VERNE"
  end

  it "should correctly explain the hash special case" do
    author = 'jules verne'           ##(hash_key
    title = 'from earth to the moon'
    hash = { author => title }       ##hash_key)

    author.upcase!                   ##+upcase

    author.should == 'JULES VERNE'
    hash['jules verne'].should match(/from earth/)
  end

  it "should explain how to convert a symbol to a string and back" do
    the_string = :all.to_s     ##+to_s

    the_string.should == 'all'

    the_symbol = 'all'.to_sym  ##+to_sym

    the_symbol.should == :all
  end

  it "should explain the public methods method" do
    x = Object.new                  ##(pub_methods
    pp x.public_methods             ##pub_methods)
    x.public_methods.first.class.should == Symbol
  end

  it "should be correct about confusing symbols and strings in a hash" do

    person = nil

    out = output_of {
      # Some broken code                       ##(mistake_hash

      person = {}
      person[:name] = 'russ'
      person[:eyes] = 'misty blue'

      # A little later...
 
      puts "Name: #{person['name']} Eyes: #{person['eyes']}" ##mistake_hash)
    }

    out.should match( /Name:  Eyes: \n/m )

    person['name'].should == nil
    person['eyes'].should == nil

    out = output_of {
      puts "Name: #{person[:name]} Eyes: #{person[:eyes]}" ##+good_hash
    }

    out.should match( /Name: russ Eyes: misty blue/m )
  end
    
end

