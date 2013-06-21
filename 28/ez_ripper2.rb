require 'ez_ripper1'

class EzRipper

  # Most of the class omitted...

  def parse_statement( statement )             ##(main
    tokens = statement.strip.split
    return if tokens.empty?

    case tokens.first 
    when 'print' 
      raise "Expected print <xpath>" unless tokens.size == 2
      @ripper.on_path( tokens[1] ) do |el|
        puts el.text
      end

    when 'delete' 
      raise "Expected delete <xpath>" unless tokens.size == 2
      @ripper.on_path( tokens[1] ) { |el| el.remove }

    when 'replace' 
      unless tokens.size == 3
        raise "Expected replace <xpath> <value>" 
      end
      @ripper.on_path( tokens[1] ) {|el| el.text = tokens[2]}

    when 'print_document'
      raise "Expected print_document" unless tokens.size == 1
      @ripper.after do |doc|
        puts doc
      end

    else 
      raise "Unknown keyword: #{tokens.first}"  
    end 
  end                                          ##main)
end 
