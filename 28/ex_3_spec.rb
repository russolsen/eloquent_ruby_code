require 'common'
require 'ez_ripper3.rb'
require 'bad_examples'
require 'good_examples'

describe EzRipper do
  it 'should handle uppercase command' do
    EzRipper.new( 'upcase.ezr').run('fellowship.xml' )
    out = output_of { EzRipper.new( 'upcase.ezr').run('fellowship.xml' ) }
    out.should match( /FELLOWSHIP/ )
  end

  it 'should handle a bad upcase command' do
    out = error_message_of { EzRipper.new( 'bad_upcase.ezr').run('fellowship.xml' ) }
    out.should match( /Expected uppercase <xpath>/ )
  end

end

