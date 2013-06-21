class Document                     ##(simple_doc
  attr_accessor :title, :author, :content

  def initialize(title, author, content)
    @title = title
    @author = author
    @content = content
  end

  def words
    @content.split
  end                              ##simple_doc)

  def average_word_length          ##(avg_word_len
    all_words = words
    
    len = all_words.inject(0.0){ |total, word| word.size + total }
    len / all_words.size
  end                              ##avg_word_len)
end                                ##+simple_doc
