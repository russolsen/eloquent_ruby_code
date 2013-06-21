require '../common/document'

class Document
  attr_accessor :read_only
  attr_reader :title, :author, :content 

  # Much of the class omitted... 

  def title=( new_title )   ##(main
    if not @read_only
      @title = new_title 
    end
  end                       ##main)

  # Similar author= and content= methods omitted... 

end
