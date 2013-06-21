require 'structured_document'
require 'pp'

class StructuredDocument                   ##(main
  def self.paragraph_type( paragraph_name, options ) 

    name = options[:font_name] || :arial 
    size = options[:font_size] || 12 
    emphasis = options[:font_emphasis] || :normal 

    code = %Q{ 
      def #{paragraph_name}(text) 
        p = Paragraph.new(:#{name}, #{size}, :#{emphasis}, text) 
        self << p
      end 
    } 
    class_eval( code ) 
  end 

  # ... 
end                                         ##main)
