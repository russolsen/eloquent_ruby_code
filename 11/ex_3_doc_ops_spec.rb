require '../code/doc3'
require '../utils/rspec_utils'

class Document                       ##(not
  # Stuff omitted...

  def !
    Document.new( title, author, "It is not true: #{content}")
  end
end                                  ##not)


class Document                          ##(unary
  # Most of the class taking a break...

  def +@ 
    Document.new( title, author, "I am sure that #{@content}" ) 
  end 
 
  def -@ 
    Document.new( title, author, "I doubt that #{@content}" ) 
  end 
end                                     ##unary)

class Document                          ##(index
  # Most of the class omitted... 

  def [](index) 
    words[index] 
  end 
end                                      ##index)

describe Document do
  it 'should have a negation argument' do
    favorite = Document.new( 'Favorite', 'Russ', 'Chocolate is best') ##+fav

    favorite.content.should match(/Choc.*best/)
    (!favorite).content.should match( /It is not.*best/ )
    File.write( 'notbest.txt', (!favorite).content)
  end

  it 'should have + and - unanary ops' do
    favorite = Document.new('Favorite', 'Russ', 'Chocolate is best') ##(unsure
    unsure = -(+favorite)                                               ##unsure)

    unsure.content.should == 'I doubt that I am sure that Chocolate is best'
    File.write( 'unsure.txt', unsure.content )
  end

  it 'should have a [] operator' do
    doc = Document.new('Favorite', 'Russ', 'Chocolate is best')
    doc[0].should == 'Chocolate'
    doc[1].should == 'is'
  end
end

