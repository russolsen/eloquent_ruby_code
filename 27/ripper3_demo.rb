require "ripper3"

ripper = XmlRipper.new                            ##(main
ripper.initialize_from_file( 'fix_author.ripper' )
ripper.run( 'fellowship.xml')                     ##main)
