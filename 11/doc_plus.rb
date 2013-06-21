class Document                          ##(class
  # Most of the class omitted...

  def +(other)                          ##(method
    Document.new( title, author, "#{content} #{other.content}" )
  end                                   ##method)
end                                     ##class)
