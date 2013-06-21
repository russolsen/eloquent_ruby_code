class SimpleBaseClass                          ##(base
  def self.inherited( new_subclass )
    puts "Hey #{new_subclass} is now a subclass of #{self}!"
  end
end                                            ##base)


class ChildClassOne < SimpleBaseClass          ##(child
end                                            ##child)
