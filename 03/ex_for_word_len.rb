require '../code/doc3'

class Document 
  # Not idiomatic at all!   ##(main

  def average_word_length
    total = 0.0

    for i in 0...words.size 
      total += words[i].size
    end 
 
    total / words.size
  end                       ##main)
end 
