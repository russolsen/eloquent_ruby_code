##

def case_no_semi(title)
##start no_semi
  case title
  when 'War And Peace'
    puts 'Tolstoy'
  when 'Romeo And Juliet'
    puts 'Shakespeare'
  else
    puts "Don't know"
  end
##end no_semi
end

def case_semi(title)
##start semi
  case title; 
  when 'War And Peace';    puts 'Tolstoy'
  when 'Romeo And Juliet'; puts 'Shakespeare'
  else; puts "Don't know"
  end
##end semi
end
