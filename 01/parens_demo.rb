# Some supporting stuff

@content = 'It was a dark and stormy night'


  def find_document( title, author ) ##(find_parens
    # Body omitted...
  end

  # ...

  find_document( 'Frankenstein', 'Shelley' ) ##find_parens)



  def find_document title, author    ##(find_no_parens
    # Body omitted...
  end

  # ...

  find_document 'Frankenstein', 'Shelley' ##find_no_parens)


  puts 'Look Ma, no parentheses!' ##+puts_no_parens

  def words           ##(words_no_parens
    @content.split
  end                 ##words_no_parens)

  def words()         ##(words_parens
    @content.split()
  end                 ##words_parens)


  if ( words.size < 100 )    ##(if_parens
    puts 'The document is not very long.'
  end                        ##if_parens)

  if words.size < 100        ##(if_no_parens
    puts 'The document is not very long.'
  end                        ##if_no_parens)
