require 'ripper1'

ripper = XmlRipper.new do |r|                  ##(main
  r.on_path( '/document/author' ) { |a| puts a.text } ##+doc_author
  r.on_path( '/document/chapter/title' ) { |t| puts t.text } 
end

ripper.run( 'fellowship.xml' )                ##main)
