require '../utils/rspec_utils'

shared_examples_for "it handles correct ezr programs" do
  it 'print author example should work' do
    out = output_of { EzRipper.new( 'print_author.ezr').run('fellowship.xml' ) }
    out.should match( /Tol/ )
  end

  it 'replace delete example should work' do
    FileUtils.cp 'replace_delete.ezr', 'temp.ezr'
    File.open( 'temp.ezr', 'a' ) {|f| f.puts 'print_document' }

    out = output_of { EzRipper.new('temp.ezr').run('fellowship.xml') }
    out.should match( /<author>Tolkien/m )
  end

  it 'replace delete print example should work' do
    out = output_of {
      EzRipper.new( 'edit.ezr').run('fellowship.xml' )       ##+edit_ezr
     }
    out.should match( /Tol/ )
    out.should_not match( /published/ )
  end
end
