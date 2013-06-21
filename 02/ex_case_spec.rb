require '../utils/rspec_utils'
require '../code/doc3'

describe 'case statement examples' do

  it 'is an example of a simple case' do
    output = output_of do
      title =  'Romeo And Juliet'

      case title            ##(simple
      when 'War And Peace'
        puts 'Tolstoy'
      when 'Romeo And Juliet'
        puts 'Shakespeare'
      else
        puts "Don't know"
      end                  ##simple)

    end
    output.should match( 'Shakespeare' )
  end


  it 'is an example of a case returning a value' do
    title =  'War And Peace'

    author = case title             ##(value
             when 'War And Peace'
               'Tolstoy'
             when 'Romeo And Juliet'
               'Shakespeare'
             else
               "Don't know"
             end                   ##value)

    author.should match( 'Tolstoy' )
  end


  it 'is an example of a case returning a value with then' do
    title =  'Carwash'
##start then

    author = case title                           ##(then
             when 'War And Peace' then 'Tolstoy'
             when 'Romeo And Juliet' then  'Shakespeare'
             else "Don't know"
             end                                 ##then)

    author.should match( "Don't know" )
  end

  it 'is an example of a case returning nil when nothing matches' do
    title =  'Carwash'

    author = case title                                  ##(nil
             when 'War And Peace' then 'Tolstoy'
             when 'Romeo And Juliet' then  'Shakespeare'
             end                                        ##nil)

    author.should == nil
  end
  
  it 'is an example of a case matching a class' do
    doc = Document.new( '', '', '' )
    output = output_of do

      case doc                        ##(class
      when Document
        puts "It's a document!"
      when String
        puts "It's a string!"
      else
        puts "Don't know what it is!"
      end                              ##class)

    end
    output.should match( /a document/ )
  end



  it 'is an example of a case matching a regex' do
    doc = Document.new( '', '', '' )
    title = 'Romeo And Ethel'
    output = output_of do

      case title                       ##(re
      when /War And .*/
        puts 'Maybe Tolstoy?'
      when /Romeo And .*/
        puts 'Maybe Shakespeare?'
      else
        puts 'Absolutely no idea...'
      end                              ##re)

    end
    output.should match( /Maybe Shakes/ )
  end

  it 'is an example of a degenerate case' do
    doc = Document.new( '', '', '' )
    title = 'War And Peace'
    block = lambda do |title|
      case                             ##(degen
      when title == 'War And Peace'
        puts 'Tolstoy'
      when title == 'Romeo And Juliet'
        puts 'Shakespeare'
      else
        puts 'Absolutely no idea...'
      end                               ##degen)

    end
    output_of { block.call("War And Peace") }.should == "Tolstoy\n"
    output_of { block.call("Romeo And Juliet") }.should == "Shakespeare\n"
    output_of { block.call("Run Dog Run") }.should match(/Abso/)
  end

end
