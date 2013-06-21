require 'ostruct'

describe OpenStruct do
  it 'should just work' do
    author = OpenStruct.new
    author.first_name = 'Stephen'
    author.last_name = 'Hawking'
    puts author.first_name
    puts author.last_name
  end
end
