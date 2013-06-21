class Document
  attr_accessor :title, :author, :content

  def initialize(title, author, content)
    @title = title
    @author = author
    @content = content
  end

  def words
    @content.split
  end

  def word_count
    words.size
  end

  def average_word_length
    all_words = words

    len = all_words.inject(0.0){ |total, word| word.size + total }
    len / all_words.size
  end
end
