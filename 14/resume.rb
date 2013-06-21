class Resume < Document 
  @@default_font = :arial

  def self.default_font=(font) 
    @@default_font = font 
  end 


  def self.default_font
    @@default_font
  end

  attr_accessor :font 


  def initialize 
    @font = @@default_font 
  end 

  # Rest of the class omitted... 
end 
