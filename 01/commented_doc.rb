# Class which represents a document
class Document

  attr_accessor :title, :author, :content

  # Initialize the document, passing in the document tile,
  # the document author, and the text of the document
  def initialize(title, author, content)
    @title = title
    @author = author
    @content = content
  end

  # Return the words in the document

  def words
    @content.split
  end

  # Return the number of words in the document

  def word_count
    words.size
  end
end
