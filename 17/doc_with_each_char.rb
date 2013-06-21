class Document
  def each_character
    index = 0
    while index < @content.size
      yield( @content[index] )
      index += 1
    end
  end
end
