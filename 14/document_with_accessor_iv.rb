require '../code/doc3'

class Document                        ##(main

  @default_font = :times

  class << self
    attr_accessor :default_font
  end

  # Rest of the class omitted... 
end                                   ##main)

class Document

  attr_accessor :font

  def initialize(title, author) 
    @title = title 
    @author = author 
    @font = Document.default_font 
  end

end
