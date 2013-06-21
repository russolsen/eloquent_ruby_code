require '../code/doc3'

class Document 
  def average_word_length          ##(main
    lengths = words.map { |word| word.size }
    len = lengths.inject { |total, word_size| word_size + total }
    len / words.size
  end                              ##main)
end 
