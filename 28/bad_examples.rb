require '../utils/rspec_utils'

shared_examples_for "it has decent error handling" do
  it 'should blow up on a bad print' do
    out = error_message_of { EzRipper.new( 'bad_print.ezr' ).run( 'fellowship.xml' ) }
    out.should match( /Expected print <xpath>/ )
  end

  it 'should blow up on a bad delete' do
    out = error_message_of { EzRipper.new( 'bad_delete.ezr' ).run( 'fellowship.xml' ) }
    out.should match( /Expected delete <xpath>/ )
  end

  it 'should blow up on a bad replace' do
    out = error_message_of { EzRipper.new( 'bad_replace.ezr' ).run( 'fellowship.xml' ) }
    out.should match( /Expected replace <xpath> <value>/ )
  end

  it 'should blow up on a bad delete' do
    out = error_message_of { EzRipper.new( 'bad_print_document.ezr' ).run( 'fellowship.xml' ) }
    out.should match( /Expected print_document/ )
  end
end
