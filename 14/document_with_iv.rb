require '../code/doc3'

class Document                    ##(iv

  @default_font = :times

  def self.default_font=(font) 
    @default_font = font 
  end 

  def self.default_font 
    @default_font 
  end

  # Rest of the class omitted... 
end                              ##iv)

class Document

  attr_accessor :font

  def initialize(title, author)     ##(init
    @title = title 
    @author = author 
    @font = Document.default_font 
  end                               ##init)

end
