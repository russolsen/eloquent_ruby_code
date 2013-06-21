class XMLReader < DocumentReader
  def self.can_read?(path) 
    /.*\.xml/ =~ path 
  end 

  def initialize(path) 
    @path = path 
  end 

  def read(path) 
    # Lots of complicated XML stuff omitted 
  end 
end
