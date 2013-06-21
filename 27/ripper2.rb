require "ripper1"

class XmlRipper                           ##(main

  def initialize(&block)
    @before_action = proc {}
    @path_actions = {}
    @after_action = proc {}
    instance_eval( &block ) if block
  end

  # Rest of the class omitted...

end                                      ##main)

