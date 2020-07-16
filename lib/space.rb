class Space

  attr_reader :space_name, :space_address

  def initialize(space_name:, space_address:)
    @space_name = space_name
    @space_address = space_address
  end

  def self.all
   if ENV['ENVIRONMENT'] == 'test'
     connection = PG.connect(dbname: 'mobbnb_test')
   else
     connection = PG.connect(dbname: 'mobbnb')
   end
     result = connection.exec("SELECT * FROM spaces") 
     result.map do |space| 
       Space.new(space_name: space['space_name'], space_address: space['space_address'])
     end
  end
end
