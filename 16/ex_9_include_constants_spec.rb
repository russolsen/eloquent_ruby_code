require '../utils/rspec_utils'

module ErrorCode 
  OK         =  0   # Successful result 
  ERROR      =  1   # SQL error or missing database 
  INTERNAL   =  2   # An internal logic error in SQLite 
  PERM       =  3   # Access permission denied 
  ABORT      =  4   # Callback routine requested an abort 
  BUSY       =  5   # The database file is locked 
  LOCKED     =  6   # A table in the database is locked 

  # Seemingly endless list of remaining error codes omitted...
end

class SomeSQLiteApplication
  include ErrorCode

  def print_status_message( status )
    if status == ERROR 
      puts "It failed!" 
    elsif status == OK
      puts "It worked!"
    else
      puts "Status was #{status}" 
    end
  end
end

describe SomeSQLiteApplication do
  it 'should print the right status message' do
    app = SomeSQLiteApplication.new
    outs = output_of { app.print_status_message( 0 ) }
    outs.should match(/It worked/)
    outs = output_of { app.print_status_message( 1) }
    outs.should match(/It failed/)
    outs = output_of { app.print_status_message( 6) }
    outs.should match(/Status was 6/)
  end
end


