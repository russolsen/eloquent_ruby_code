describe 'unit tests' do
  it 'should pass when you run it' do
    Dir['*_test.rb'].sort.each do |test_file|
      puts test_file
      puts ">> #{test_file}"
      system("ruby -I . #{test_file}").should == true
    end
  end
end
