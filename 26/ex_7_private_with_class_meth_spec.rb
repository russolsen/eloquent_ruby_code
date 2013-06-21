require '../utils/rspec_utils'
require 'structured_document'
require 'structured_doc_def_method'

class StructuredDocument         ##(main

  # Rest of the class omitted... 

  def self.disclaimer 
    "This document is here for all to see" 
  end 

  def self.privatize 
    private :content 

    def self.disclaimer 
      "This document is a deep, dark secret" 
    end 
  end 
end                              ##main)


class BankStatement < StructuredDocument             ##(private 
  paragraph_type( :bad_news, 
    :font_name => :arial,
    :font_size => 60,
    :font_emphasis => :bold )

  privatize 
end                                                  ##private)

class PublicDocument < StructuredDocument
end
 

describe BankStatement do
  it "should have the warning" do
    BankStatement.disclaimer.should match(/deep, dark/)
    out = output_of {
      puts BankStatement.disclaimer                  ##+print_dis
    }
    out.should match(/deep, dark/)
    File.write( 'disclaimer.txt', out )
  end
end

describe PublicDocument do
  it "should have the right disclaimer" do
    PublicDocument.disclaimer.should match(/here for all/)
  end
end

