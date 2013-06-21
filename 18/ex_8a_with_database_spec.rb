class Database
end
 

class SomeApplication
  def with_database_connection( connection_info )   ##(main
    connection = Database.new( connection_info ) 
    begin
      yield( connection ) 
    ensure
      connection.close
    end
  end                                             ##main)
end

describe SomeApplication do

  it 'should create and close a new database connection' do
    connection = mock
    connection.should_receive(:close)
    connection.should_receive(:query)
    Database.should_receive(:new).with('info').and_return(connection)

    app = SomeApplication.new
    app.with_database_connection('info') {|c| c.query}
  end
end

