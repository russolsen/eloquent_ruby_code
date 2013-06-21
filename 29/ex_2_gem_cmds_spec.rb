require '../utils/rspec_utils'

describe 'gem command' do

  it 'should have an install cmd' do
    eval "`#{File.read('gem.install.cmd')}`"
  end

  it 'should install a specific gem version' do
    eval "`#{File.read('gem.install.04.cmd')}`"
  end

  it 'should install many gem version' do
    eval "`#{File.read('gem.install.many.cmd')}`"
  end

  it 'should have a list subcomment' do
    out = eval("`#{File.read('gem.list.cmd')}`")
    out.should match(/6\.12.*6\.9.*0\.4/m)
    File.write( 'versions.txt', out.breakup )
  end

end
