require '../code/doc3'

class Document 
  def word_frequencies            ##(main
    freq = {}
    words.each do |word|
      if freq[word]
        freq[word] += 1
      else
        freq[word] = 1
      end
    end 
    freq
  end                            ##main)
end 
