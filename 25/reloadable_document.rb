require '../code/doc3'

class Document       ##(main
  def self.reload
    load( __FILE__ )
  end

  # Rest of the class omitted...
end                  ##main)

class Document
  def doit
    111
  end
end
