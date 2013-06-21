require 'document_with_accessor_iv'

class Presentation < Document             ##(pres

  @default_font = :nimbus
 
  class << self 
    attr_accessor :default_font 
  end 

  def initialize(title, author) 
    @title = title 
    @author = author 
    @font = Presentation.default_font 
  end 

  # most of the class omitted... 
end                                      ##pres)

class Resume < Document                  ##(resume

  @default_font = :arial 
 
  class << self 
    attr_accessor :default_font 
  end 

  def initialize(title, author) 
    @title = title 
    @author = author 
    @font = Presentation.default_font 
  end 

  # most of the class omitted... 
end                                     ##resume)

