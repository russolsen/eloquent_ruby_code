class SomeApplication

  # Rest of the class omitted...

  def with_logging(description)
    begin
      @logger.debug( "Starting #{description}" )
      return_value = yield
      @logger.debug( "Completed #{description}" )
      return_value
    rescue
      @logger.error( "#{description} failed!!")
      raise
    end
  end

  alias_method :execute_between_logging_statements, :with_logging

  def good_name
    with_logging( "update" ) do                      ##(good_name
      employee.load
      employee.status = :retired
      employee.save                                      
    end                                                  ##good_name)
  end

  def bad_name
    execute_between_logging_statements( "update" ) do ##(bad_name
      employee.load
      employee.status = :retired
      employee.save
    end                                                  ##bad_name)
  end

end

class SomeApplication
  attr_accessor :employee

  def initialize( logger, employee )
    @logger = logger
    @employee = employee
  end
end


describe SomeApplication do
  it "execute_between_logging_statements example should work" do
    logger = mock
    logger.should_receive(:debug).exactly(2).times
    employee = mock
    employee.should_receive(:load)
    employee.should_receive(:save)
    employee.should_receive(:"status=").with(:retired)

    app = SomeApplication.new( logger, employee )
    app.bad_name

  end

  it "with_logging example should work" do
    logger = mock
    logger.should_receive(:debug).exactly(2).times
    employee = mock
    employee.should_receive(:load)
    employee.should_receive(:save)
    employee.should_receive(:"status=").with(:retired)

    app = SomeApplication.new( logger, employee )
    app.good_name
  end

end
