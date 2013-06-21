require 'stringio'
require 'pp'

def output_of( &block )
  output = StringIO.new
  $stdout = output
  begin
    block.call
  ensure
    $stdout = STDOUT
  end
  output.string
end

def error_message_of( &block )
  begin
    block.call
    fail( "did not throw an exception" )
  rescue
    return $!.message
  end
end

class String
  def breakup
    bits = self.split
    result = ['']
    bits.each do | bit |
      result << '' if result.last.size > 50
      result.last << bit
      result.last << ' '
    end
    result.join("\n")
  end
end

class File
  def self.write( path, string )
    File.open( path, 'w' ) {|f| f.print(string)}
  end
end
