require 'ripper3'
require 'pp'

class EzRipper                            ##(main
  def initialize( program_path ) 
    @ripper = XmlRipper.new
    parse_program(program_path) 
  end 

  def run( xml_file )
    @ripper.run( xml_file )
  end 

  def parse_program( program_path ) 
    File.open(program_path) do |f| 
      until f.eof?
        parse_statement( f.readline )
      end 
    end 
  end 
    
  def parse_statement( statement ) 
    tokens = statement.strip.split
    return if tokens.empty?

    case tokens.first 
    when 'print' 
      @ripper.on_path( tokens[1] ) do |el|
        puts el.text
      end

    when 'delete' 
      @ripper.on_path( tokens[1] ) { |el| el.remove }

    when 'replace' 
      @ripper.on_path( tokens[1] ) { |el| el.text = tokens[2] }

    when 'print_document'
      @ripper.after do |doc|
        puts doc
      end

    else 
      raise "Unknown keyword: #{tokens.first}"  
    end 
  end 
end                                     ##main)
