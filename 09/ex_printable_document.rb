require 'document'

class PrintableDocument < Document            ##(main
  def print( printer )
    return 'Printer unavailable' unless printer.available?
    printer.render( "#{title}\n" )
    printer.render( "By #{author}\n" )
    printer.render( content )
    'Done'
  end
end                                          ##main)
