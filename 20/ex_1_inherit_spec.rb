require '../utils/rspec_utils'

describe 'inherit example' do
  it 'should produce the right output' do
    out = output_of {
       load 'inherited_demo.rb'
     } 

    out.should match(/.*ChildClassOne.*subclass.*SimpleBaseClass/)

    File.write( 'inherit.txt', out )
  end

end
