require 'ez_ripper2'

class EzRipper

  # Most of the class omitted...

  def parse_statement( statement )           ##(main

    statement = statement.sub( /#.*/, '' )

    case statement.strip
    when ''
      # Skip blank lines

    when /print\s+'(.*?)'/
      @ripper.on_path( $1 ) do |el|
        puts el.text
      end

    when /delete\s+'(.*?)'/
      @ripper.on_path( $1 ) { |el| el.remove }

    when /replace\s+'(.*?)'\s+'(.*?)'$/
      @ripper.on_path( $1 ) { |el| el.text = $2 }

    when /uppercase\s+'(.*?)'/
      @ripper.on_path( $1 ) { |el| el.text = el.text.upcase }

    when /print_document/
      @ripper.after do |doc|
        puts doc
      end

    else
      raise "Don't know what to do with: #{statement}"
    end
  end                                          ##main)
end

