class TaskArguments                ##(main
  attr_reader :names 
 
  # Lots and lots omitted... 

  def initialize(names, values) 
    @names = names 
    @hash = {} 
    names.each_with_index do |name, i| 
      @hash[name.to_sym] = values[i] unless values[i].nil? 
    end 
  end 

  def [](index) 
    @hash[index.to_sym]
  end 

  # ... lot's more omitted 
end                                ##main)

class TaskArguments                ##(method_missing
  # Rest of the class the same as before...

  def method_missing(sym, *args, &block) 
    @hash[sym.to_sym] 
  end
end                                ##method_missing)

describe TaskArguments do
  it "should work as described" do
    my_arguments = TaskArguments.new( [:month, :year], [ 'sept', 2009 ] ) ##+new

    my_arguments[:month]     # 'sept'    ##(month_year
    my_arguments[:year]      # 2009      ##month_year)

    my_arguments[:month].should == 'sept'
    my_arguments[:year].should == 2009
    my_arguments[:xxxxx].should == nil

    (
      my_arguments.month   # Also 'sept'  ##+by_name
    ).should == 'sept'

    (
      my_arguments.year    # Also 2009   ##+by_name
    ).should == 2009

    (
      my_arguments.object_idddd               ##+bad_id
    ).should == nil
  end
end

