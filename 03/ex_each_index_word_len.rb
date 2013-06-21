require '../code/doc3'

class Document 
  # A bit more idomatic, but not much   ##(main

  def average_word_length
    total = 0.0
    words.each_index { |i| total += words[i].size }
    total / words.size
  end                                   ##main)
end 
