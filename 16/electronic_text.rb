class ElectronicText      ##(text
  attr_accessor :title, :author, :content

  def initialize( title, author, content )
    @title = title
    @author = author
    @content = content
  end
end                       ##text)

class ElectronicBook < ElectronicText  ##(book
   # Lots of complicated stuff omitted...
end                                    ##book)
