require 'ripper1'

ripper = XmlRipper.new do |r|                    ##(main
  r.on_path( '/document/author' ) do |author| 
    author.text = 'J.R.R. Tolkien' 
  end
  r.after { |doc| puts doc }
end

ripper.run( 'fellowship.xml' )                   ##main)
