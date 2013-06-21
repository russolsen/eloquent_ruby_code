require 'pp'

class DocumentReader                               ##(doc

  class << self
    attr_reader :reader_classes
  end

  @reader_classes = []

  def self.read(path) 
    reader = reader_for(path) 
    return nil unless reader 
    reader.read(path) 
  end 

  def self.reader_for(path) 
    reader_class = DocumentReader.reader_classes.find do |klass| 
      klass.can_read?(path) 
    end 
    return reader_class.new(path) if reader_class
    nil
  end 

  # One critical bit omitted, but stay tuned...
end                                           ##doc)

class DocumentReader

  # ... the vital missing piece               ##(vital

  def self.inherited(subclass)
    DocumentReader.reader_classes << subclass 
  end                                         ##vital)
end
