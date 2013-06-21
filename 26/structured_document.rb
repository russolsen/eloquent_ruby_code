class Paragraph                                         ##(paragraph
  attr_accessor :font_name, :font_size, :font_emphasis 
  attr_accessor :text 

  def initialize( font_name, font_size, font_emphasis, text='') 
    @font_name = font_name 
    @font_size = font_size 
    @font_emphasis = font_emphasis 
    @text = text 
  end

  def to_s
    @text
  end

  # Rest of the class omitted... 
end                                                    ##paragraph)

class StructuredDocument                               ##(structured
  attr_accessor :title, :author, :paragraphs 
  
  def initialize( title, author ) 
    @title = title 
    @author = author 
    @paragraphs = [] 
    yield( self ) if block_given? 
  end 

  def <<( paragraph ) 
    @paragraphs << paragraph 
  end 

  def content 
    @paragraphs.inject('') { |text, para| "#{text}\n#{para}" }
  end 

  # ... 
end                                                   ##structured)
