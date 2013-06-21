require '../code/doc3'

class Document             ##(main

  @@default_paper_size = :a4 

  def self.default_paper_size
    @@default_paper_size 
  end 

  def self.default_paper_size=(new_size) 
    @@default_paper_size = new_size
  end 

  attr_accessor :title, :author, :content 
  attr_accessor :paper_size 

  def initialize(title, author, content) 
    @title = title 
    @author = author 
    @content = content 
    @paper_size = @@default_paper_size 
  end 

  # Rest of the class omitted...
end                       ##main)
