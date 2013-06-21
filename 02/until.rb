##

def until_loop( document )
##start
  until document.is_printed?
    document.print_next_page
  end
##end
end


end 
