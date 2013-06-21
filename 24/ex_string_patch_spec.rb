require '../code/doc4'

class String                  ##(string
  def +( other ) 
    if other.kind_of? Document 
      new_content = self + other.content 
      return Document.new(other.title, other.author, new_content) 
    end 
    result = self.dup
    result << other.to_str
    result 
  end
end                          ##string)

describe String do
  it 'should know how to add itself to a Document' do
    d1 = Document.new( 'example', 'russ', 'out there' )
    d2 = 'hello ' + d1
    d2.author.should == 'russ'
    d2.title.should == 'example'
    d2.content.should == 'hello out there'
  end

  it "should still be able to add" do
    ('aaa' + 'bbb').should == 'aaabbb'
    ('' + 'bbb').should == 'bbb'
    ('aaa' + '').should == 'aaa'
  end

end
