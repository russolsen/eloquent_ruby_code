##

module Rendering                            ##(basic
  class Font
    attr_accessor :name, :weight, :size

    def initialize( name, weight=:normal, size=10 )
      @name = name
      @weight = weight
      @size = size
    end

    # Rest of the class omitted...
  end

  class PaperSize
    attr_accessor :name, :width, :height

    def initialize( name='US Let', width=8.5, height=11.0 )
      @name = name
       @width = width
      @height = height
    end
    # Rest of the class omitted...
  end
end                                      ##basic)

module Rendering                         ##(const
  # Font and PaperSize classes omitted...
  
  DEFAULT_FONT = Font.new( 'default' )
  DEFAULT_PAPER_SIZE = PaperSize.new
end                                      ##const)

