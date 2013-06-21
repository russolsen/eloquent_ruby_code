require 'ripper2'

ripper = XmlRipper.new do                   ##(main
  on_path( '/document/author' ) do |author|
    author.text = 'J.R.R. Tolkien'
  end
  after { |doc| puts doc }
end

ripper.run( 'fellowship.xml' )              ##main)
