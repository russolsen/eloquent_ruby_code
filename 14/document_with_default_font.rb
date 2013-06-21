require 'document_with_cv'


class Document                   ##(main
  @@default_font = :times

   # Rest of the class omitted... 
end                              ##main)

class Document
  def self.default_font=(font) 
    @@default_font = font 
   end 


  def self.default_font
    @@default_font
  end
end

