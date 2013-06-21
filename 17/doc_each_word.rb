class Document

  # Stuff omitted...

  def each_word                           ##(main
    words.each { |word| yield( word ) }
  end                                     ##main)
end
