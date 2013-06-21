
describe 'getting a specific version of a gem' do

  it 'should work like the books says' do
    gem 'ruby-mp3info', '=0.5'
    require 'mp3info'
  end

end
