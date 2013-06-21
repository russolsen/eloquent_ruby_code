describe Array do
  it 'should be able to shift new items in' do
    names = []                                   ##(main
    names << 'Rob'      # names.size is now 1
    names << 'Denise'   # names.size is now 2    ##main)

    names.should == %w{ Rob Denise }
  end
end

