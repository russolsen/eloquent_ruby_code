require 'structured_document'
require 'pp'


class StructuredDocument                              ##(main
  def self.paragraph_type( paragraph_name, options ) 
    name = options[:font_name] || :arial 
    size = options[:font_size] || 12 
    emphasis = options[:font_emphasis] || :none 

    define_method(paragraph_name) do |text| 
      paragraph = Paragraph.new( name, size, emphasis, text ) 
      self << paragraph 
    end 
  end 

  # ... 
end                                                  ##main)
