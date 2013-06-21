class Title 
  attr_reader :long_name, :short_name 
  attr_reader :isbn 

  def initialize(long_name, short_name, isbn) 
    @long_name = long_name 
    @short_name = short_name 
    @isbn = isbn 
  end 
end 

class Author 
  attr_reader :first_name, :last_name 

  def initialize( first_name, last_name ) 
    @first_name = first_name 
    @last_name = last_name 
  end 
end 
