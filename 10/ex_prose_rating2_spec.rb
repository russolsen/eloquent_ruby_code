class Document

  # Most of class omitted...

  def pretentious_density
    # Somehow compute density of pretentious words
  end
  
  def informal_density
    # Somehow compute density of informal words
  end
  
  def prose_rating                        ##(main
    rating = :about_right 

    if pretentious_density > 0.3 
      if informal_density < 0.2 
        rating = :really_pretentious 
      else 
        rating = :somewhat_pretentious 
      end 
    elsif pretentious_density < 0.1 
      if informal_density > 0.3 
        rating = :really_informal 
      else 
         rating = :somewhat_informal 
      end 
    end 

    rating 
  end                                        ##main)

end

class Document
  attr_reader :pretentious_density, :informal_density

  def initialize( pretentious, informal )
    @pretentious_density = pretentious
    @informal_density = informal
  end
end

load 'pretentious_examples.rb'
