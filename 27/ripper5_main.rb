require "ripper5"

r = XmlRipper.new
r.initialize_from_file( ARGV[0] )
r.run( ARGV[1] )
