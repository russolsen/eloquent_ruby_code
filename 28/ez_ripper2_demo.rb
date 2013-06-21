require 'ez_ripper2.rb'


ezr = EzRipper.new( 'author.ezr' )
puts "running"
ezr.run( 'fellowship.xml' )

