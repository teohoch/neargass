
describe 'CNE Consumer'  do
  before(:all) do
    @consumer = CNEConsumer.new
  end
  it 'should raise argument error when not provided location codes'
  it 'should raise runtime error when the server gives any code except 200'
  it 'should return a JSON Object when the request succeeds' do
    @consumer.gas_stations_by_location(05602)
  end
end