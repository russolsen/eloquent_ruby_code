require 'ez_ripper2'

class EzRipper

  # Most of the class omitted...

  def parse_statement( statement )
    tokens = statement.strip.split
    return if tokens.empty?

    case tokens.first 

    when 'uppercase'                                                     ##(uppercase
      raise "Expected uppercase <xpath>" unless tokens.size == 2
      @ripper.on_path( tokens[1] ) { |el| el.text = el.text.upcase }     ##uppercase)

    when 'print_document'
      raise "print_document does not take any arguments" unless tokens.size == 1
      @ripper.after do |doc|
        puts doc
      end

    else 
      raise "Unknown keyword: #{tokens.first}"  
    end 
  end 
end 
