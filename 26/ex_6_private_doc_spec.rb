require 'structured_document'
require 'structured_doc_def_method'

class StructuredDocument        ##(main

  # Rest of the class omitted... 

  def self.privatize 
    private :content  
  end 
end                             ##main)


class BankStatement < StructuredDocument              ##(bank
  paragraph_type( :bad_news, 
    :font_name => :arial,
    :font_size => 60,
    :font_emphasis => :bold )

  privatize 
end                                                   ##bank)
 

describe BankStatement do
  it "should act like a structured doc, with private content" do
    statement = nil

    lambda {
      statement = BankStatement.new( 'Bank Statement', 'Russ')  ##(shock
      statement.bad_news("You're broke!") 
      puts statement.content                                    ##shock)
    }.should raise_error(NoMethodError)

    statement.private_methods.should include(:content)

    statement.paragraphs.size.should == 1
    p = statement.paragraphs.first
    p.font_name.should == :arial
    p.font_size.should == 60
    p.font_emphasis.should == :bold
    p.text.should match(/broke/)
    
  end
end


