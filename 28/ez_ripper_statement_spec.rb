require 'pp'

describe 'EzRipperStatementParser' do

  it 'should work as advertised' do
    require 'treetop'               ##(main
    require 'ez_ripper_statement'

    statement =  "replace '/document/author' 'Russ Olsen'"
    parser = EzRipperStatementParser.new
    parse_tree = parser.parse( statement )  ##main)

    parse_tree.should_not == nil
  end
end
