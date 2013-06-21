
def yes( re, *strings )
  strings.each { |s| s.should match(re) }
end

def no( re, *strings )
  strings.each { |s| s.should_not match(re) }
end

describe 'chapter' do

  it 'should have a good explanation of reg char matching' do
    yes /x/, 'x' 
    yes /aaa/, 'aaa'
    yes /123/, '123'
    yes /R2D2/, 'R2D2'
    no  /R2D2/, 'r2d2'
    no  /R2D2/, 'R2d2'
  end

  it 'should have a good explanation of the dot' do
    yes /./, 'x', '%', '~'

    yes /../, 'xx' ,'4F' ,'[!'
    no /../, 'a'
  end

  it 'should have a good explanation of the bs' do
    yes /\./, '.'
    no  /\./, 'x'

    yes /3\.14/, '3.14'
    yes /Mr\. Olsen/, 'Mr. Olsen'
    no  /Mr\. Olsen/, 'Mrx Olsen'
  end

  it 'should have a good explanation of simple combos' do
    yes /A./, 'AM', 'An', 'At', 'A='
    no  /A./, 'aM', 'an', 'xt', '=A'

    yes /...X/, 'UVWX', 'XOOX'

    yes /.r\. Smith/, '@Dr. Smith', 'Mr. Smith'
  end

  it 'should have a good explanation of sets' do
    yes /[aeiou]/, 'a', 'e', 'i', 'o', 'u'
    no  /aeiou/, 'A', 'E', 'x'

    yes /[0123456789]/, '1', '3', '7', '0'
    yes /[0123456789abdef]/, '1', '3', '7', '0', 'a', 'b', 'e', 'd', 'e', 'f'
    no  /[0123456789abdef]/, 'x', 'g', 'X'
  end

  it 'should explain building up combos' do
    yes /[Rr]uss [Oo]lsen/, 'Russ Olsen', 'russ olsen', 'Russ olsen', 'russ Olsen'
    yes /[0123456789abcdef][0123456789abcdef]/, 'aa', '0f', '11', 'ff', 'a4', '33', '3e'
    yes /[aApP][mM]/, 'am', 'PM', 'aM', 'Pm'
  end

  it 'should explain ranges' do
    yes /[0-9]/, '0', '2', '7', '9'
    yes /[a-z]/, 'a', 'q', 'w', 'z'
    no  /[a-z]/, 'A', '^', '8', '-'

    yes /[0-9abcdef]/, '0', '5', '9', 'a', 'c', 'e', 'f'
    yes /[0-9a-f]/, '0', '5', '9', 'a', 'c', 'e', 'f'
    yes /[0-9a-zA-Z_]/, '0', '5', '9', 'a', 'q', 'A', 'G', '_'
    no  /[0-9a-zA-Z_]/, '-', '%'
  end

  it 'should explain shortcuts' do
    yes /\d/, '0', '2', '7', '9'
    no  /\d/, 'a', 'A', '_', '*'

    yes /\d\d/, '00', '99', '86', '03', '30'

    yes /\w/, 'a', 'A', 'z', 'Z', '9', '0', '_'
    no  /\w/, '.', '*', '^', '=', ' ', ',', '['

    yes /\s/, " ", "\t", "\n"
  end

  it 'should explain alternatives' do
    yes /A|B/, 'A', 'B'
    no  /A|B/, 'X', '9'

    yes /AM|PM/, 'AM', 'PM'
    no  /AM|PM/, '**', '12', 'AA', 'pM', 'pm'

    yes /Batman|Spiderman/, 'Batman', 'Spiderman'

    yes /A\.M\.|AM|P\.M\.|PM/, 'A.M.', 'AM', 'P.M.', 'PM'

    yes /The (car|boat) is red/, 'The car is red', 'The boat is red '
    no  /The (car|boat) is red/, 'The cat is red', 'The is red '
  end

  it 'should have a good time match' do
    yes /\d\d:\d\d (AM|PM)/, '09:24 AM', '00:00 AM', '00:00 PM'
  end

  it 'should have good examples of the star' do
    yes /A*/, '', 'A', 'AA', ('A'* 2), 'A' * 24
    yes /AB*/, 'A', 'AB', 'ABB', 'ABBBBBBBB', 'ABBBBBBBBBBBBB'

    yes /R*uby/, *%q{uby Ruby RRuby RRRRRRRuby}
    yes /Rub*y/, *%q{Ruy Ruby Rubbbbbbbbby}
    yes /R*u*by/, 'by', 'Rby', 'RRRRRRuby', 'RRRRRRRuuuuuuuuby' 

    yes /[aeiou]*/, 'aeiouuuaaa', 'a', 'e', 'i', 'iiiiieee'
    yes /[0-9]*/, '00', '0', '', '9', '4336464', '560938732'
    yes /[0-9a-f]*/, 'ae', 'fffff', '0836afedcba', '0c3ff'
  end

  it 'should have good star dot examples' do
    yes /George.*/, 'George Smith', 'George Jones', 'George'
    yes /.*George/, 'Boy George', 'X George', 'George'
    yes /.*George.*/, 'Boy George', 'X George X', 'Fred George', 'George'
  end
end
