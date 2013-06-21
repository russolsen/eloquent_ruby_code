require '../utils/rspec_utils'

def run_that_block( &that_block )          ##(run_that_block
  puts "About to run the block"
  that_block.call
  puts "Done running the block"
end                                        ##run_that_block)

def run_block_with_check( &that_block )
  that_block.call if that_block            ##+check_block
end

describe 'explicit blocks' do
  it 'should call the block' do
    out = output_of { run_that_block {puts "hello"} }
    out.should match( /About.*hello.*Done/m )
  end

  it 'should check that a block is supplied' do
    run_block_with_check
    out = output_of { run_block_with_check { puts 'hello' } }
    out.should == "hello\n"
  end
end
