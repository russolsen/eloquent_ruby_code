require '../code/doc3'

class Document                              ##(main

  # Most of the class omitted...

  def average_word_length
    total = 0.0
    words.each { |word| total += word.size }
    
    total / word_count
  end
end                                          ##main)
