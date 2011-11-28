require "ripper4"

r = XmlRipper.new                       ##(main
r.initialize_from_file( ARGV[0] )
r.run( ARGV[1] )                        ##main)
