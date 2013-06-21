require '../utils/rspec_utils'

describe 'various examples' do

  it 'should keep printing with until' do
    document = mock
    document.should_receive(:print_next_page).exactly(3).times
    document.should_receive(:printed?).and_return(false, false, false, true)

    until document.printed? ##(until
      document.print_next_page
    end                     ##until)

  end

  it 'should be a correct unless example' do
   @title = nil
   @read_only = false
   new_title = 'newnewnew'

   unless @read_only        ##(unless
     @title = new_title
   end                      ##unless)

   @title.should == new_title
  end

  it 'should be a correct unless 1 liner' do
   @title = nil
   @read_only = false
   new_title = 'newnewnew'

  @title = new_title unless @read_only  ##+short_unless

   @title.should == new_title
  end

  it 'should be a correct if 1 liner' do
    @title = nil
    @writable = true
    new_title = 'newnewnew'

    @title = new_title if @writable      ##+short_if

    @title.should == new_title
  end

  it 'should keep printing short while' do
    document = mock
    document.should_receive(:print_next_page).exactly(3).times
    document.should_receive(:pages_available?).and_return(true, true, true, false)

    document.print_next_page while document.pages_available? ##+print_short_while

  end

  it 'should keep printing short until' do
    document = mock
    document.should_receive(:print_next_page).exactly(3).times
    document.should_receive(:printed?).and_return(false, false, false, true)

    document.print_next_page until document.printed?   ##+print_short_until

  end

  it 'should be a correct for statement' do
    output = output_of do

      fonts = [ 'courier', 'times roman', 'helvetica' ]    ##(for

      for font in fonts
        puts font
      end                                                 ##for)

    end
    output.should match( /courier/)
    output.should match( /times/)
    output.should match( /hel/)
  end

  it 'should be a correct each statement' do
    output = output_of do

      fonts = [ 'courier', 'times roman', 'helvetica' ]  ##(each
 
      fonts.each do |font|
        puts font
      end                                                ##each)

    end
    output.should match( /courier/)
    output.should match( /times/)
    output.should match( /hel/)
  end

end
