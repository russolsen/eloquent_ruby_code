require '../common/document'


class Document               ##(main
  attr_accessor :writable 
  attr_reader :title, :author, :content 

  # Much of the class omitted... 

  def title=( new_title ) 
    if @writable 
      @title = new_title 
    end 
  end 

  # Similar author= and content= methods omitted... 

end                          ##main)
