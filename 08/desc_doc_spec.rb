require 'pp'
require "desc_doc"
require 'title_author'

describe Document do
  before :each do
    @title = Title.new( 'Long', 'lg', '123')
    @author = Author.new( 'Bob', 'Smith' )
    @doc = Document.new( @title, @author, 'hello' )
  end

  it "should hold onto title and author" do
    @doc.title.long_name.should == 'Long'
    @doc.title.short_name.should == 'lg'
    @doc.title.isbn.should == '123'
    @doc.author.first_name.should == 'Bob'
    @doc.author.last_name.should == 'Smith'
  end

  it 'should have a working description' do
    @doc.description.should == 'Long by Smith'
  end

end
