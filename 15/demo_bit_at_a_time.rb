##

module Rendering
  class Font
    def initialize( name, weight=:normal, size=10 )
    end
  end

  class PaperSize
    def initialize( name='US Let', width=8.5, height=11.0 )
    end
  end
end


module Rendering                 ##(bit_font
  class Font
    # Bulk of class omitted...
  end

   DEFAULT_FONT = Font.new( 'default' )
end                              ##bit_font)

module Rendering                 ##(bit_paper
  class PaperSize
    # Bulk of class omitted...
  end

  DEFAULT_PAPER_SIZE = PaperSize.new
end                              ##bit_paper)

raise "failed" unless Rendering::Font.instance_of?(Class)
raise "failed" unless Rendering::DEFAULT_FONT.instance_of?(Rendering::Font)

raise "failed" unless Rendering::PaperSize.instance_of?(Class)
raise "failed" unless Rendering::DEFAULT_PAPER_SIZE.instance_of?(Rendering::PaperSize)

