require "ripper2"

class XmlRipper                           ##(main

  def initialize_from_file( path )
    instance_eval( File.read( path ), path )
  end

  # Rest of the class omitted...

end                                       ##main)

