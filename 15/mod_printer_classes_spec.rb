require 'mod_printer_classes'

def make_admin( use_laser_printer )

  if use_laser_printer                ##(example
    print_module = TonsOToner
  else
    print_module = OceansOfInk
  end

  # Later...

  admin = print_module::Administration.new  ##example)
end

describe 'example from chapter' do
  it 'should work' do
    admin = make_admin( true )
    admin.class.should == TonsOToner::Administration

    admin = make_admin( false )
    admin.class.should == OceansOfInk::Administration
  end
end

describe TonsOToner do
  it 'should have a PrintQueue class' do
    TonsOToner::PrintQueue.class.should == Class
    pq = TonsOToner::PrintQueue.new
    pq.submit( 'nothing' )
    pq.cancel( 'nothing' )
  end

  it 'should have an Administration class' do
    TonsOToner::Administration.class.should == Class
    admin = TonsOToner::Administration.new
    admin.power_off
    admin.start_self_test
  end
end

describe OceansOfInk do
  it 'should have a PrintQueue class' do
    OceansOfInk::PrintQueue.class.should == Class
    pq = OceansOfInk::PrintQueue.new
    pq.submit( 'nothing' )
  end

  it 'should have an Administration class' do
    OceansOfInk::Administration.class.should == Class
    admin = OceansOfInk::Administration.new
  end
end

