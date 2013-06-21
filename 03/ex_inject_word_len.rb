require '../code/doc3'

class Document 
  def average_word_length          ##(main
    total = words.inject(0.0){ |result, word| word.size + result}
    total / word_count
  end                              ##main)
end 
