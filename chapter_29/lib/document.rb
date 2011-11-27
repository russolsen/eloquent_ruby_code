

class Document

  attr_accessor :title, :author, :content

  def initialize( title, author, content )
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
    number_word_characters / word_count
  end

  def number_word_characters
    words.inject( 0 ) { |total, word| total += word.size }
  end

end
