require '../utils/rspec_utils'
require '../code/doc3'

describe 'staying out of trouble examples' do

  it 'should have a good do end loop' do
    doc = Document.new( '', '', 'hello world' )

    out = output_of {
      doc.words.each do |word|      ##(fold_do
        puts word 
      end                           ##fold_do)
    }

    out.should match( /hello\nworld\n/m )
  end

  it 'should have a good {} loop' do
    doc = Document.new( '', '', 'hello world' )

    out = output_of {
      doc.words.each { |word| puts word }  ##+braces
    }

    out.should match( /hello\nworld\n/m )
  end

  it 'should have a good no paren example' do
    doc = Document.new( 'title', 'russ', 'hello world' )

    out = output_of {
      puts doc.author                     ##+puts_no_paren
    }

    out.should == "russ\n"
  end

  it 'should have a good no paren defined?' do
    doc = Document.new( 'title', 'russ', 'hello world' )
    (
      doc.instance_of? Document              ##+instance_of
    ).should == true
  end

  it 'should have a good example of a complicated expression' do
    doc = Document.new( 'title', 'russ', 'hello world' )
    puts doc.instance_of? self.class.superclass.class     ##+complex_1
    puts doc.instance_of?( self.class.superclass.class )  ##+complex_2
  end

end
