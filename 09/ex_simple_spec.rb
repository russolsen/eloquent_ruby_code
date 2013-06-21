require '../code/doc3'

describe Document do                                           ##(main
  it 'should not catch fire when you create an instance' do
    Document.new( 'title', 'author', 'stuff' ).should_not == nil
  end
end                                                            ##main)
