  def average_word_length
    len = words.inject(0.0){ |total, word| word.size + total }
    len / words.size
  end
